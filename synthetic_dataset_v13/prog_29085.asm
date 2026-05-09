; DESCRIPTION: Places a purple 119x106 rectangle at position (154, 23).
; PLAN: r0=154(x), r1=23(y), r2=119(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 23
LDI r2, 119
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
