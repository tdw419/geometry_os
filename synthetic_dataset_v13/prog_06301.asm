; DESCRIPTION: Places a white 20x17 rectangle at position (139, 185).
; PLAN: r0=139(x), r1=185(y), r2=20(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 185
LDI r2, 20
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
