; DESCRIPTION: Places a white 77x68 rectangle at position (231, 110).
; PLAN: r0=231(x), r1=110(y), r2=77(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 110
LDI r2, 77
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
