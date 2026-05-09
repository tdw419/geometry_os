; DESCRIPTION: Places a white 35x54 rectangle at position (137, 19).
; PLAN: r0=137(x), r1=19(y), r2=35(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 19
LDI r2, 35
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
