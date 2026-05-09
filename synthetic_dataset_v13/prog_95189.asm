; DESCRIPTION: Places a purple 70x110 rectangle at position (212, 91).
; PLAN: r0=212(x), r1=91(y), r2=70(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 91
LDI r2, 70
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
