; DESCRIPTION: Renders a green box of size 104x88 starting at (311, 18).
; PLAN: r0=311(x), r1=18(y), r2=104(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 18
LDI r2, 104
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
