; DESCRIPTION: Places a blue 77x49 rectangle at position (142, 172).
; PLAN: r0=142(x), r1=172(y), r2=77(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 172
LDI r2, 77
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
