; DESCRIPTION: Places a green 22x77 rectangle at position (390, 34).
; PLAN: r0=390(x), r1=34(y), r2=22(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 34
LDI r2, 22
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
