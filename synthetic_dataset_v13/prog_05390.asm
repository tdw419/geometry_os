; DESCRIPTION: Places a blue 117x25 rectangle at position (216, 205).
; PLAN: r0=216(x), r1=205(y), r2=117(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 205
LDI r2, 117
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
