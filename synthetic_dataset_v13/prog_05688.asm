; DESCRIPTION: Places a green 75x47 rectangle at position (25, 110).
; PLAN: r0=25(x), r1=110(y), r2=75(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 110
LDI r2, 75
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
