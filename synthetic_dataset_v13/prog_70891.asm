; DESCRIPTION: Places a purple 24x70 rectangle at position (8, 180).
; PLAN: r0=8(x), r1=180(y), r2=24(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 180
LDI r2, 24
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
