; DESCRIPTION: Places a magenta 45x55 rectangle at position (70, 180).
; PLAN: r0=70(x), r1=180(y), r2=45(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 180
LDI r2, 45
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
