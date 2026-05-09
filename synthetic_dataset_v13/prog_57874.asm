; DESCRIPTION: Places a purple 68x25 rectangle at position (176, 58).
; PLAN: r0=176(x), r1=58(y), r2=68(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 58
LDI r2, 68
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
