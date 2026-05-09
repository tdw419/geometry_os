; DESCRIPTION: Places a red 75x92 rectangle at position (155, 45).
; PLAN: r0=155(x), r1=45(y), r2=75(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 45
LDI r2, 75
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
