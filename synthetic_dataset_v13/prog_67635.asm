; DESCRIPTION: Renders a green box of size 109x81 starting at (356, 74).
; PLAN: r0=356(x), r1=74(y), r2=109(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 74
LDI r2, 109
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
