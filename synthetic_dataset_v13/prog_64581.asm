; DESCRIPTION: Places a green 70x117 rectangle at position (430, 23).
; PLAN: r0=430(x), r1=23(y), r2=70(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 23
LDI r2, 70
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
