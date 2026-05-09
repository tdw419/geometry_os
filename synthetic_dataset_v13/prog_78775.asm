; DESCRIPTION: Places a magenta 79x93 rectangle at position (55, 84).
; PLAN: r0=55(x), r1=84(y), r2=79(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 84
LDI r2, 79
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
