; DESCRIPTION: Places a green 118x99 rectangle at position (69, 79).
; PLAN: r0=69(x), r1=79(y), r2=118(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 79
LDI r2, 118
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
