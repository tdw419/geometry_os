; DESCRIPTION: Renders a black box of size 114x33 starting at (179, 103).
; PLAN: r0=179(x), r1=103(y), r2=114(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 103
LDI r2, 114
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
