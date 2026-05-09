; DESCRIPTION: Places a magenta 68x118 rectangle at position (371, 33).
; PLAN: r0=371(x), r1=33(y), r2=68(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 33
LDI r2, 68
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
