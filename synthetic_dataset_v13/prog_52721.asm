; DESCRIPTION: Composite: Places a orange line segment connecting (81, 58) to (99, 237) then Places a white circle of radius 77 at center (167, 176) then Sets a single blue pixel at (401, 242).
; PLAN: r0=81(x1), r1=58(y1), r2=99(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=176(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=401(x), r11=242(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 58
LDI r2, 99
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 176
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 401
LDI r11, 242
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
