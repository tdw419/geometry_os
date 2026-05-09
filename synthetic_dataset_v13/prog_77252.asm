; DESCRIPTION: Composite: Renders a black line between points (434, 63) and (111, 109) then Sets a single blue pixel at (85, 157) then Renders a cyan box of size 22x72 starting at (41, 40).
; PLAN: r0=434(x1), r1=63(y1), r2=111(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=157(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=41(x), r11=40(y), r12=22(width), r13=72(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 63
LDI r2, 111
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 157
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 41
LDI r11, 40
LDI r12, 22
LDI r13, 72
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
