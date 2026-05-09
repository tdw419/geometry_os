; DESCRIPTION: Renders a green box of size 55x118 starting at (117, 76).
; PLAN: r0=117(x), r1=76(y), r2=55(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 76
LDI r2, 55
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
