; DESCRIPTION: Renders a green box of size 67x104 starting at (99, 98).
; PLAN: r0=99(x), r1=98(y), r2=67(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 98
LDI r2, 67
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
