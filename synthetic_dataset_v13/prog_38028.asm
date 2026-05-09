; DESCRIPTION: Places a purple 26x117 rectangle at position (250, 16).
; PLAN: r0=250(x), r1=16(y), r2=26(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 16
LDI r2, 26
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
