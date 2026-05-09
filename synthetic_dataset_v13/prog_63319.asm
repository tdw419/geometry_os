; DESCRIPTION: Renders a green box of size 85x81 starting at (420, 158).
; PLAN: r0=420(x), r1=158(y), r2=85(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 158
LDI r2, 85
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
