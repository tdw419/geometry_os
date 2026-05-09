; DESCRIPTION: Places a purple 43x63 rectangle at position (396, 155).
; PLAN: r0=396(x), r1=155(y), r2=43(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 155
LDI r2, 43
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
