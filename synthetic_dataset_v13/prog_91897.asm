; DESCRIPTION: Places a magenta 92x52 rectangle at position (40, 26).
; PLAN: r0=40(x), r1=26(y), r2=92(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 26
LDI r2, 92
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
