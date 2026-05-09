; DESCRIPTION: Places a blue 25x83 rectangle at position (8, 86).
; PLAN: r0=8(x), r1=86(y), r2=25(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 86
LDI r2, 25
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
