; DESCRIPTION: Places a white 99x94 rectangle at position (366, 66).
; PLAN: r0=366(x), r1=66(y), r2=99(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 66
LDI r2, 99
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
