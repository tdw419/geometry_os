; DESCRIPTION: Places a green 99x119 rectangle at position (140, 90).
; PLAN: r0=140(x), r1=90(y), r2=99(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 90
LDI r2, 99
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
