; DESCRIPTION: Places a blue 28x52 rectangle at position (33, 155).
; PLAN: r0=33(x), r1=155(y), r2=28(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 155
LDI r2, 28
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
