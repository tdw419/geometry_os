; DESCRIPTION: Places a green 35x14 rectangle at position (140, 155).
; PLAN: r0=140(x), r1=155(y), r2=35(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 155
LDI r2, 35
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
