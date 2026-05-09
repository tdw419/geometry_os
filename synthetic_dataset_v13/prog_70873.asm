; DESCRIPTION: Places a blue 18x63 rectangle at position (159, 13).
; PLAN: r0=159(x), r1=13(y), r2=18(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 13
LDI r2, 18
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
