; DESCRIPTION: Places a white 19x75 rectangle at position (230, 175).
; PLAN: r0=230(x), r1=175(y), r2=19(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 175
LDI r2, 19
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
