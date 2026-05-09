; DESCRIPTION: Places a yellow 87x110 rectangle at position (371, 13).
; PLAN: r0=371(x), r1=13(y), r2=87(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 13
LDI r2, 87
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
