; DESCRIPTION: Places a blue 58x97 rectangle at position (441, 50).
; PLAN: r0=441(x), r1=50(y), r2=58(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 50
LDI r2, 58
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
