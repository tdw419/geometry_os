; DESCRIPTION: Places a green 97x50 rectangle at position (149, 33).
; PLAN: r0=149(x), r1=33(y), r2=97(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 33
LDI r2, 97
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
