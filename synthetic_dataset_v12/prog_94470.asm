; DESCRIPTION: Renders a green box of size 52x72 starting at (232, 58).
; PLAN: r0=232(x), r1=58(y), r2=52(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 58
LDI r2, 52
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
