; DESCRIPTION: Renders a green box of size 81x70 starting at (321, 168).
; PLAN: r0=321(x), r1=168(y), r2=81(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 168
LDI r2, 81
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
