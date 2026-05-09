; DESCRIPTION: Composite: Places a red line segment connecting (200, 166) to (473, 143) then Creates a cyan circular shape at (436, 181) with radius 50 then Sets a single magenta pixel at (195, 16).
; PLAN: r0=200(x1), r1=166(y1), r2=473(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=181(y), r7=50(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=16(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 166
LDI r2, 473
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 181
LDI r7, 50
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 16
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
