; DESCRIPTION: Places a blue 46x25 rectangle at position (422, 87).
; PLAN: r0=422(x), r1=87(y), r2=46(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 87
LDI r2, 46
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
