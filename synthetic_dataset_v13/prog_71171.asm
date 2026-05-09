; DESCRIPTION: Places a green 31x97 rectangle at position (141, 28).
; PLAN: r0=141(x), r1=28(y), r2=31(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 28
LDI r2, 31
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
