; DESCRIPTION: Places a blue 93x82 rectangle at position (35, 110).
; PLAN: r0=35(x), r1=110(y), r2=93(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 110
LDI r2, 93
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
