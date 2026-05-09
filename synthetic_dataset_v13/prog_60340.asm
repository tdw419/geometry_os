; DESCRIPTION: Renders a green box of size 66x67 starting at (107, 4).
; PLAN: r0=107(x), r1=4(y), r2=66(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 4
LDI r2, 66
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
