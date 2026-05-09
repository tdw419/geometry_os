; DESCRIPTION: Places a magenta 50x89 rectangle at position (121, 66).
; PLAN: r0=121(x), r1=66(y), r2=50(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 66
LDI r2, 50
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
