; DESCRIPTION: Places a yellow 117x47 rectangle at position (70, 97).
; PLAN: r0=70(x), r1=97(y), r2=117(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 97
LDI r2, 117
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
