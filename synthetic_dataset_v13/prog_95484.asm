; DESCRIPTION: Places a cyan 78x117 rectangle at position (74, 110).
; PLAN: r0=74(x), r1=110(y), r2=78(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 110
LDI r2, 78
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
