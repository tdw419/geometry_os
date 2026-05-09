; DESCRIPTION: Places a blue 75x68 rectangle at position (400, 97).
; PLAN: r0=400(x), r1=97(y), r2=75(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 97
LDI r2, 75
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
