; DESCRIPTION: Composite: Creates a yellow circular shape at (357, 82) with radius 23 then Renders a blue line between points (192, 71) and (200, 150) then Places a red dot at position (261, 92).
; PLAN: r0=357(x), r1=82(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x1), r6=71(y1), r7=200(x2), r8=150(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=92(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 82
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 71
LDI r7, 200
LDI r8, 150
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 92
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
