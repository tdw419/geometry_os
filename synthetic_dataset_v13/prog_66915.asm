; DESCRIPTION: Places a magenta 104x106 rectangle at position (84, 23).
; PLAN: r0=84(x), r1=23(y), r2=104(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 23
LDI r2, 104
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
