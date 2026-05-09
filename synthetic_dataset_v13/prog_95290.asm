; DESCRIPTION: Places a green 84x78 rectangle at position (5, 75).
; PLAN: r0=5(x), r1=75(y), r2=84(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 75
LDI r2, 84
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
