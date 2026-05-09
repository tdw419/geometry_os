; DESCRIPTION: Places a blue 25x80 rectangle at position (438, 99).
; PLAN: r0=438(x), r1=99(y), r2=25(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 99
LDI r2, 25
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
