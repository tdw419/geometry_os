; DESCRIPTION: Places a white 110x106 rectangle at position (260, 99).
; PLAN: r0=260(x), r1=99(y), r2=110(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 99
LDI r2, 110
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
