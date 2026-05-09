; DESCRIPTION: Places a white 58x29 rectangle at position (321, 80).
; PLAN: r0=321(x), r1=80(y), r2=58(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 80
LDI r2, 58
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
