; DESCRIPTION: Places a blue 77x11 rectangle at position (158, 223).
; PLAN: r0=158(x), r1=223(y), r2=77(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 223
LDI r2, 77
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
