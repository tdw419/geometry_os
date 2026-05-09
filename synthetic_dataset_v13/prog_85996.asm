; DESCRIPTION: Renders a blue box of size 16x93 starting at (337, 104).
; PLAN: r0=337(x), r1=104(y), r2=16(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 104
LDI r2, 16
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
