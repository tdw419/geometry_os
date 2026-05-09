; DESCRIPTION: Places a blue 47x110 rectangle at position (132, 8).
; PLAN: r0=132(x), r1=8(y), r2=47(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 8
LDI r2, 47
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
