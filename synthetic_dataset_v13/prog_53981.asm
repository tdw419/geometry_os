; DESCRIPTION: Places a green 90x98 rectangle at position (84, 26).
; PLAN: r0=84(x), r1=26(y), r2=90(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 26
LDI r2, 90
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
