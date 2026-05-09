; DESCRIPTION: Places a magenta 78x75 rectangle at position (45, 51).
; PLAN: r0=45(x), r1=51(y), r2=78(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 51
LDI r2, 78
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
