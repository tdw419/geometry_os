; DESCRIPTION: Renders a black box of size 12x96 starting at (143, 98).
; PLAN: r0=143(x), r1=98(y), r2=12(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 98
LDI r2, 12
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
