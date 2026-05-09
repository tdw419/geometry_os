; DESCRIPTION: Places a magenta 65x55 rectangle at position (133, 158).
; PLAN: r0=133(x), r1=158(y), r2=65(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 158
LDI r2, 65
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
