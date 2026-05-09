; DESCRIPTION: Creates a yellow rectangular region at (8, 98) spanning 69 by 23 pixels.
; PLAN: r0=8(x), r1=98(y), r2=69(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 98
LDI r2, 69
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
