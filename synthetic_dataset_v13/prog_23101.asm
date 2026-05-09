; DESCRIPTION: Places a green 36x97 rectangle at position (36, 72).
; PLAN: r0=36(x), r1=72(y), r2=36(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 72
LDI r2, 36
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
