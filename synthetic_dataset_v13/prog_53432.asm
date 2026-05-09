; DESCRIPTION: Places a magenta 45x99 rectangle at position (425, 122).
; PLAN: r0=425(x), r1=122(y), r2=45(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 122
LDI r2, 45
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
