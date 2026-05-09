; DESCRIPTION: Places a magenta 56x106 rectangle at position (411, 10).
; PLAN: r0=411(x), r1=10(y), r2=56(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 10
LDI r2, 56
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
