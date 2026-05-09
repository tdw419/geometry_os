; DESCRIPTION: Composite: Renders a black box of size 113x83 starting at (374, 1) then Places a purple dot at position (4, 157).
; PLAN: r0=374(x), r1=1(y), r2=113(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=4(x), r6=157(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 374
LDI r1, 1
LDI r2, 113
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 157
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
