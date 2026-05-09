; DESCRIPTION: Places a magenta 105x75 rectangle at position (171, 145).
; PLAN: r0=171(x), r1=145(y), r2=105(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 145
LDI r2, 105
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
