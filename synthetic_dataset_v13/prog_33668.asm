; DESCRIPTION: Places a orange 57x114 rectangle at position (144, 140).
; PLAN: r0=144(x), r1=140(y), r2=57(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 140
LDI r2, 57
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
