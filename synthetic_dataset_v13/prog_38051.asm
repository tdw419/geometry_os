; DESCRIPTION: Creates a yellow rectangular region at (449, 16) spanning 15 by 26 pixels.
; PLAN: r0=449(x), r1=16(y), r2=15(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 16
LDI r2, 15
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
