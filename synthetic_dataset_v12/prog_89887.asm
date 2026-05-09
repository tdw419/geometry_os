; DESCRIPTION: Composite: Sets a single black pixel at (451, 57) then Draws a magenta circle centered at (394, 158) with radius 73 then Places a green line segment connecting (24, 81) to (298, 123).
; PLAN: r0=451(x), r1=57(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=394(x), r6=158(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x1), r11=81(y1), r12=298(x2), r13=123(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 57
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 394
LDI r6, 158
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 81
LDI r12, 298
LDI r13, 123
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
