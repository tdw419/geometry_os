; DESCRIPTION: Places a magenta 56x25 rectangle at position (166, 145).
; PLAN: r0=166(x), r1=145(y), r2=56(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 145
LDI r2, 56
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
