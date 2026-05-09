; DESCRIPTION: Places a blue 47x66 rectangle at position (427, 1).
; PLAN: r0=427(x), r1=1(y), r2=47(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 1
LDI r2, 47
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
