; DESCRIPTION: Places a white 22x55 rectangle at position (414, 110).
; PLAN: r0=414(x), r1=110(y), r2=22(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 110
LDI r2, 22
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
