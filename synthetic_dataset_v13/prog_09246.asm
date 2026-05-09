; DESCRIPTION: Renders a green box of size 119x104 starting at (337, 141).
; PLAN: r0=337(x), r1=141(y), r2=119(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 141
LDI r2, 119
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
