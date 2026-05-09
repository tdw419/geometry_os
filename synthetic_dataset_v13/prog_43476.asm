; DESCRIPTION: Renders a black box of size 96x18 starting at (187, 179).
; PLAN: r0=187(x), r1=179(y), r2=96(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 179
LDI r2, 96
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
