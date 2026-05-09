; DESCRIPTION: Places a purple 80x113 rectangle at position (389, 100).
; PLAN: r0=389(x), r1=100(y), r2=80(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 100
LDI r2, 80
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
