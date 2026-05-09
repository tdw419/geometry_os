; DESCRIPTION: Places a blue 50x100 rectangle at position (244, 155).
; PLAN: r0=244(x), r1=155(y), r2=50(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 155
LDI r2, 50
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
