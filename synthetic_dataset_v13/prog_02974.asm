; DESCRIPTION: Places a yellow 90x117 rectangle at position (231, 40).
; PLAN: r0=231(x), r1=40(y), r2=90(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 40
LDI r2, 90
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
