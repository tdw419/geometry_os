; DESCRIPTION: Places a white 110x54 rectangle at position (99, 26).
; PLAN: r0=99(x), r1=26(y), r2=110(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 26
LDI r2, 110
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
