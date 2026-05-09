; DESCRIPTION: Renders a green box of size 67x29 starting at (81, 179).
; PLAN: r0=81(x), r1=179(y), r2=67(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 179
LDI r2, 67
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
