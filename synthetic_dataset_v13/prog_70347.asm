; DESCRIPTION: Renders a green box of size 67x17 starting at (390, 21).
; PLAN: r0=390(x), r1=21(y), r2=67(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 21
LDI r2, 67
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
