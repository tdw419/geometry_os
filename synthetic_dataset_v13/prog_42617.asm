; DESCRIPTION: Places a green 18x36 rectangle at position (331, 183).
; PLAN: r0=331(x), r1=183(y), r2=18(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 183
LDI r2, 18
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
