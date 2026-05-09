; DESCRIPTION: Composite: Sets a single white pixel at (151, 2) then Places a magenta circle of radius 66 at center (134, 71) then Places a yellow line segment connecting (180, 231) to (204, 32).
; PLAN: r0=151(x), r1=2(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=134(x), r6=71(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=180(x1), r11=231(y1), r12=204(x2), r13=32(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 2
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 134
LDI r6, 71
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 180
LDI r11, 231
LDI r12, 204
LDI r13, 32
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
