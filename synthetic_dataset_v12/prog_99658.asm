; DESCRIPTION: Places a blue 11x97 rectangle at position (464, 39).
; PLAN: r0=464(x), r1=39(y), r2=11(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 39
LDI r2, 11
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
