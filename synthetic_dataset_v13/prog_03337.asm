; DESCRIPTION: Places a blue 81x56 rectangle at position (422, 55).
; PLAN: r0=422(x), r1=55(y), r2=81(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 55
LDI r2, 81
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
