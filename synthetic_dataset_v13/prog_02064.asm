; DESCRIPTION: Renders a yellow box of size 100x68 starting at (290, 78).
; PLAN: r0=290(x), r1=78(y), r2=100(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 78
LDI r2, 100
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
