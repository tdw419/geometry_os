; DESCRIPTION: Places a yellow 117x97 rectangle at position (382, 45).
; PLAN: r0=382(x), r1=45(y), r2=117(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 45
LDI r2, 117
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
