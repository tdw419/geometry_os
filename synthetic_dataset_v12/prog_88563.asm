; DESCRIPTION: Places a green 66x56 rectangle at position (74, 110).
; PLAN: r0=74(x), r1=110(y), r2=66(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 110
LDI r2, 66
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
