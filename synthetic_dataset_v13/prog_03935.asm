; DESCRIPTION: Places a green 77x103 rectangle at position (97, 4).
; PLAN: r0=97(x), r1=4(y), r2=77(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 4
LDI r2, 77
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
