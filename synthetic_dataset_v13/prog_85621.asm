; DESCRIPTION: Places a green 12x79 rectangle at position (490, 138).
; PLAN: r0=490(x), r1=138(y), r2=12(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 138
LDI r2, 12
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
