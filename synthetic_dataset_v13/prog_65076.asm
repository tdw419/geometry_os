; DESCRIPTION: Places a purple 83x84 rectangle at position (24, 118).
; PLAN: r0=24(x), r1=118(y), r2=83(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 118
LDI r2, 83
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
