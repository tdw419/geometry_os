; DESCRIPTION: Places a magenta 80x110 rectangle at position (248, 53).
; PLAN: r0=248(x), r1=53(y), r2=80(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 53
LDI r2, 80
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
