; DESCRIPTION: Places a magenta 79x12 rectangle at position (216, 98).
; PLAN: r0=216(x), r1=98(y), r2=79(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 98
LDI r2, 79
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
