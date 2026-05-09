; DESCRIPTION: Places a magenta 49x75 rectangle at position (180, 0).
; PLAN: r0=180(x), r1=0(y), r2=49(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 0
LDI r2, 49
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
