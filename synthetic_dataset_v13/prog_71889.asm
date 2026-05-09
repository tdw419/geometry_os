; DESCRIPTION: Places a blue 60x23 rectangle at position (272, 130).
; PLAN: r0=272(x), r1=130(y), r2=60(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 130
LDI r2, 60
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
