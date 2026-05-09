; DESCRIPTION: Renders a black box of size 60x73 starting at (329, 10).
; PLAN: r0=329(x), r1=10(y), r2=60(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 10
LDI r2, 60
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
