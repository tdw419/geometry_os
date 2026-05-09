; DESCRIPTION: Places a green 37x97 rectangle at position (20, 34).
; PLAN: r0=20(x), r1=34(y), r2=37(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 34
LDI r2, 37
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
