; DESCRIPTION: Places a magenta 36x74 rectangle at position (377, 33).
; PLAN: r0=377(x), r1=33(y), r2=36(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 33
LDI r2, 36
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
