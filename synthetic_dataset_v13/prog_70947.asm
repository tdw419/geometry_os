; DESCRIPTION: Places a magenta 15x83 rectangle at position (391, 58).
; PLAN: r0=391(x), r1=58(y), r2=15(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 58
LDI r2, 15
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
