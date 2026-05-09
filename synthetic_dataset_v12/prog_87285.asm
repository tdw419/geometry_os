; DESCRIPTION: Renders a black box of size 90x113 starting at (211, 30).
; PLAN: r0=211(x), r1=30(y), r2=90(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 30
LDI r2, 90
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
