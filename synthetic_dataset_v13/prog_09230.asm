; DESCRIPTION: Places a blue 14x109 rectangle at position (359, 121).
; PLAN: r0=359(x), r1=121(y), r2=14(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 121
LDI r2, 14
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
