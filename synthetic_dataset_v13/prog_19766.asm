; DESCRIPTION: Composite: Sets a single purple pixel at (345, 118) then Renders a black disk with center (230, 145) and radius 10 then Renders a purple box of size 44x15 starting at (348, 90).
; PLAN: r0=345(x), r1=118(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=145(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=348(x), r11=90(y), r12=44(width), r13=15(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 118
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 145
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 348
LDI r11, 90
LDI r12, 44
LDI r13, 15
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
