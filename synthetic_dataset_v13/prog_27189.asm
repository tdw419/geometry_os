; DESCRIPTION: Places a green 87x18 rectangle at position (132, 220).
; PLAN: r0=132(x), r1=220(y), r2=87(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 220
LDI r2, 87
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
