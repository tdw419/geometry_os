; DESCRIPTION: Renders a black box of size 48x13 starting at (332, 159).
; PLAN: r0=332(x), r1=159(y), r2=48(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 159
LDI r2, 48
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
