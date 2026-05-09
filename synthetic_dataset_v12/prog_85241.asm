; DESCRIPTION: Places a green 90x99 rectangle at position (31, 103).
; PLAN: r0=31(x), r1=103(y), r2=90(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 103
LDI r2, 90
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
