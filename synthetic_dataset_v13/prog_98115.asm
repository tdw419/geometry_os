; DESCRIPTION: Places a white 79x14 rectangle at position (185, 217).
; PLAN: r0=185(x), r1=217(y), r2=79(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 217
LDI r2, 79
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
