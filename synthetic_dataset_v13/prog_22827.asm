; DESCRIPTION: Renders a green box of size 85x117 starting at (191, 58).
; PLAN: r0=191(x), r1=58(y), r2=85(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 58
LDI r2, 85
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
