; DESCRIPTION: Composite: Sets a single orange pixel at (38, 61) then Renders a magenta box of size 19x51 starting at (366, 111) then Draws a black circle centered at (417, 89) with radius 26.
; PLAN: r0=38(x), r1=61(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=111(y), r7=19(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x), r11=89(y), r12=26(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 38
LDI r1, 61
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 366
LDI r6, 111
LDI r7, 19
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 89
LDI r12, 26
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
