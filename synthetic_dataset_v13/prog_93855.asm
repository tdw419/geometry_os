; DESCRIPTION: Places a magenta 47x89 rectangle at position (111, 89).
; PLAN: r0=111(x), r1=89(y), r2=47(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 89
LDI r2, 47
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
