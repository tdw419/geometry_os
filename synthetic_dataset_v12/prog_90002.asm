; DESCRIPTION: Places a blue 50x89 rectangle at position (302, 110).
; PLAN: r0=302(x), r1=110(y), r2=50(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 110
LDI r2, 50
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
