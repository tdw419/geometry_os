; DESCRIPTION: Places a blue 46x19 rectangle at position (133, 79).
; PLAN: r0=133(x), r1=79(y), r2=46(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 79
LDI r2, 46
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
