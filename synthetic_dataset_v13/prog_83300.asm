; DESCRIPTION: Places a blue 116x30 rectangle at position (250, 129).
; PLAN: r0=250(x), r1=129(y), r2=116(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 129
LDI r2, 116
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
