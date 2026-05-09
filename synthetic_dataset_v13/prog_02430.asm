; DESCRIPTION: Places a white 98x58 rectangle at position (260, 105).
; PLAN: r0=260(x), r1=105(y), r2=98(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 105
LDI r2, 98
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
