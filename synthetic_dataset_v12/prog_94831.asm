; DESCRIPTION: Places a white 97x98 rectangle at position (314, 3).
; PLAN: r0=314(x), r1=3(y), r2=97(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 3
LDI r2, 97
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
