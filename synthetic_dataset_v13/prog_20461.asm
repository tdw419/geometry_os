; DESCRIPTION: Renders a green box of size 67x76 starting at (161, 90).
; PLAN: r0=161(x), r1=90(y), r2=67(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 90
LDI r2, 67
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
