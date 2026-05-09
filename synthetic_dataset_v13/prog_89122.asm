; DESCRIPTION: Places a magenta 20x21 rectangle at position (163, 33).
; PLAN: r0=163(x), r1=33(y), r2=20(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 33
LDI r2, 20
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
