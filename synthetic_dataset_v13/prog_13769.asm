; DESCRIPTION: Renders a green box of size 66x35 starting at (179, 81).
; PLAN: r0=179(x), r1=81(y), r2=66(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 81
LDI r2, 66
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
