; DESCRIPTION: Places a magenta 98x56 rectangle at position (40, 75).
; PLAN: r0=40(x), r1=75(y), r2=98(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 75
LDI r2, 98
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
