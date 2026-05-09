; DESCRIPTION: Places a blue 89x110 rectangle at position (74, 20).
; PLAN: r0=74(x), r1=20(y), r2=89(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 20
LDI r2, 89
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
