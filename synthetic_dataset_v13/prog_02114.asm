; DESCRIPTION: Renders a green box of size 15x67 starting at (157, 68).
; PLAN: r0=157(x), r1=68(y), r2=15(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 68
LDI r2, 15
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
