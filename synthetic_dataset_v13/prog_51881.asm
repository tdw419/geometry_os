; DESCRIPTION: Places a white 18x110 rectangle at position (364, 18).
; PLAN: r0=364(x), r1=18(y), r2=18(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 18
LDI r2, 18
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
