; DESCRIPTION: Renders a blue box of size 10x68 starting at (232, 86).
; PLAN: r0=232(x), r1=86(y), r2=10(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 86
LDI r2, 10
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
