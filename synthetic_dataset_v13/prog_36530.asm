; DESCRIPTION: Places a blue 87x65 rectangle at position (46, 66).
; PLAN: r0=46(x), r1=66(y), r2=87(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 66
LDI r2, 87
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
