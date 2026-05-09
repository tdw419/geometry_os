; DESCRIPTION: Places a green 12x22 rectangle at position (438, 101).
; PLAN: r0=438(x), r1=101(y), r2=12(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 101
LDI r2, 12
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
