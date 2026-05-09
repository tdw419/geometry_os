; DESCRIPTION: Places a blue 66x31 rectangle at position (277, 136).
; PLAN: r0=277(x), r1=136(y), r2=66(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 136
LDI r2, 66
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
