; DESCRIPTION: Places a magenta 56x110 rectangle at position (437, 72).
; PLAN: r0=437(x), r1=72(y), r2=56(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 72
LDI r2, 56
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
