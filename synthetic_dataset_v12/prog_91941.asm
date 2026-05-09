; DESCRIPTION: Places a magenta 105x62 rectangle at position (55, 177).
; PLAN: r0=55(x), r1=177(y), r2=105(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 177
LDI r2, 105
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
