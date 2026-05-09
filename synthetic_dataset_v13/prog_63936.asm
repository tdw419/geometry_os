; DESCRIPTION: Composite: Places a red line segment connecting (204, 52) to (397, 23) then Places a cyan circle of radius 32 at center (260, 190) then Sets a single black pixel at (481, 67).
; PLAN: r0=204(x1), r1=52(y1), r2=397(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=190(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=481(x), r11=67(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 52
LDI r2, 397
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 190
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 481
LDI r11, 67
LDI r12, 0x000000
PSET r10, r11, r12
HALT
