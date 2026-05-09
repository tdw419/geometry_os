; DESCRIPTION: Places a blue 77x13 rectangle at position (169, 60).
; PLAN: r0=169(x), r1=60(y), r2=77(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 60
LDI r2, 77
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
