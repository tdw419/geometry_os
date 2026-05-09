; DESCRIPTION: Composite: Renders a purple box of size 113x84 starting at (353, 1) then Sets a single orange pixel at (29, 41).
; PLAN: r0=353(x), r1=1(y), r2=113(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x), r6=41(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 1
LDI r2, 113
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 41
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
