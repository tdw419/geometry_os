; DESCRIPTION: Places a green 66x83 rectangle at position (145, 22).
; PLAN: r0=145(x), r1=22(y), r2=66(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 22
LDI r2, 66
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
