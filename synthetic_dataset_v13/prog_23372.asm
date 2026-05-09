; DESCRIPTION: Places a magenta 52x78 rectangle at position (225, 70).
; PLAN: r0=225(x), r1=70(y), r2=52(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 70
LDI r2, 52
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
