; DESCRIPTION: Creates a yellow rectangular region at (60, 225) spanning 28 by 13 pixels.
; PLAN: r0=60(x), r1=225(y), r2=28(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 225
LDI r2, 28
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
