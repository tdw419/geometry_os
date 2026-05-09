; DESCRIPTION: Places a purple 83x118 rectangle at position (266, 68).
; PLAN: r0=266(x), r1=68(y), r2=83(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 68
LDI r2, 83
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
