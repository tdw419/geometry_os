; DESCRIPTION: Renders a black box of size 85x97 starting at (282, 28).
; PLAN: r0=282(x), r1=28(y), r2=85(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 28
LDI r2, 85
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
