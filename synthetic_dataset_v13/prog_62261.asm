; DESCRIPTION: Places a purple 75x54 rectangle at position (139, 123).
; PLAN: r0=139(x), r1=123(y), r2=75(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 123
LDI r2, 75
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
