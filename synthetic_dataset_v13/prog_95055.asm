; DESCRIPTION: Renders a green box of size 21x102 starting at (67, 119).
; PLAN: r0=67(x), r1=119(y), r2=21(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 119
LDI r2, 21
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
