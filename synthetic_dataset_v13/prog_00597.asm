; DESCRIPTION: Places a purple 81x85 rectangle at position (188, 28).
; PLAN: r0=188(x), r1=28(y), r2=81(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 28
LDI r2, 81
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
