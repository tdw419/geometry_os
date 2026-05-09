; DESCRIPTION: Places a green 22x39 rectangle at position (430, 99).
; PLAN: r0=430(x), r1=99(y), r2=22(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 99
LDI r2, 22
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
