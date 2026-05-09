; DESCRIPTION: Composite: Places a black circle of radius 29 at center (252, 145) then Renders a magenta box of size 78x51 starting at (96, 131) then Sets a single red pixel at (17, 117).
; PLAN: r0=252(x), r1=145(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=131(y), r7=78(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=17(x), r11=117(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 252
LDI r1, 145
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 131
LDI r7, 78
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 17
LDI r11, 117
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
