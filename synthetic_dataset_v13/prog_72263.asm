; DESCRIPTION: Places a magenta 45x34 rectangle at position (360, 168).
; PLAN: r0=360(x), r1=168(y), r2=45(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 168
LDI r2, 45
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
