; DESCRIPTION: Places a green 77x79 rectangle at position (163, 69).
; PLAN: r0=163(x), r1=69(y), r2=77(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 69
LDI r2, 77
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
