; DESCRIPTION: Places a purple 63x54 rectangle at position (69, 96).
; PLAN: r0=69(x), r1=96(y), r2=63(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 96
LDI r2, 63
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
