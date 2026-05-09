; DESCRIPTION: Places a magenta 119x110 rectangle at position (272, 7).
; PLAN: r0=272(x), r1=7(y), r2=119(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 7
LDI r2, 119
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
