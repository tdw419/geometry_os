; DESCRIPTION: Composite: Places a magenta circle of radius 46 at center (427, 109) then Places a yellow line segment connecting (200, 21) to (485, 154) then Sets a single white pixel at (245, 171).
; PLAN: r0=427(x), r1=109(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x1), r6=21(y1), r7=485(x2), r8=154(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=171(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 427
LDI r1, 109
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 21
LDI r7, 485
LDI r8, 154
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 171
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
