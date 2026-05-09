; DESCRIPTION: Places a magenta 65x106 rectangle at position (408, 105).
; PLAN: r0=408(x), r1=105(y), r2=65(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 105
LDI r2, 65
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
