; DESCRIPTION: Renders a green box of size 81x48 starting at (382, 74).
; PLAN: r0=382(x), r1=74(y), r2=81(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 74
LDI r2, 81
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
