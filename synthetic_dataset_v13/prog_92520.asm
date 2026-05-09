; DESCRIPTION: Places a blue 78x99 rectangle at position (414, 75).
; PLAN: r0=414(x), r1=75(y), r2=78(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 75
LDI r2, 78
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
