; DESCRIPTION: Renders a black box of size 10x79 starting at (329, 170).
; PLAN: r0=329(x), r1=170(y), r2=10(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 170
LDI r2, 10
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
