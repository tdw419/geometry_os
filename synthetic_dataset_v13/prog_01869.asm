; DESCRIPTION: Places a white 79x49 rectangle at position (364, 55).
; PLAN: r0=364(x), r1=55(y), r2=79(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 55
LDI r2, 79
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
