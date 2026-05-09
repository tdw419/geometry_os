; DESCRIPTION: Places a magenta 74x105 rectangle at position (110, 82).
; PLAN: r0=110(x), r1=82(y), r2=74(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 82
LDI r2, 74
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
