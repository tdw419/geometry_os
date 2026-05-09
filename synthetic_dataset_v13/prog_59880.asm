; DESCRIPTION: Renders a green box of size 82x118 starting at (185, 119).
; PLAN: r0=185(x), r1=119(y), r2=82(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 119
LDI r2, 82
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
