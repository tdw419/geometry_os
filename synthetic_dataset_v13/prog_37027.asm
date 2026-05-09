; DESCRIPTION: Places a blue 96x58 rectangle at position (3, 184).
; PLAN: r0=3(x), r1=184(y), r2=96(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 184
LDI r2, 96
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
