; DESCRIPTION: Creates a yellow rectangular region at (383, 134) spanning 13 by 30 pixels.
; PLAN: r0=383(x), r1=134(y), r2=13(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 134
LDI r2, 13
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
