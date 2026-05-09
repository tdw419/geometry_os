; DESCRIPTION: Renders a black box of size 66x24 starting at (437, 179).
; PLAN: r0=437(x), r1=179(y), r2=66(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 179
LDI r2, 66
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
