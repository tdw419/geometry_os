; DESCRIPTION: Draws a black rectangle at (374, 45) with width 110 and height 93.
; PLAN: r0=374(x), r1=45(y), r2=110(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 45
LDI r2, 110
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
