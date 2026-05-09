; DESCRIPTION: Places a blue 28x13 rectangle at position (409, 150).
; PLAN: r0=409(x), r1=150(y), r2=28(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 150
LDI r2, 28
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
