; DESCRIPTION: Places a purple 80x21 rectangle at position (185, 212).
; PLAN: r0=185(x), r1=212(y), r2=80(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 212
LDI r2, 80
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
