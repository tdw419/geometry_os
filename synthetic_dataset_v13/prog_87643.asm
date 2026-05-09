; DESCRIPTION: Renders a black box of size 23x79 starting at (365, 53).
; PLAN: r0=365(x), r1=53(y), r2=23(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 53
LDI r2, 23
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
