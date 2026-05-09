; DESCRIPTION: Places a blue 109x112 rectangle at position (194, 9).
; PLAN: r0=194(x), r1=9(y), r2=109(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 9
LDI r2, 109
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
