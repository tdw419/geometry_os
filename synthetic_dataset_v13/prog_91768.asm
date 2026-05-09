; DESCRIPTION: Places a blue 30x119 rectangle at position (223, 129).
; PLAN: r0=223(x), r1=129(y), r2=30(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 129
LDI r2, 30
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
