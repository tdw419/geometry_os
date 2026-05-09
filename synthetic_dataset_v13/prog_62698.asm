; DESCRIPTION: Places a red 35x15 rectangle at position (441, 175).
; PLAN: r0=441(x), r1=175(y), r2=35(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 175
LDI r2, 35
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
