; DESCRIPTION: Creates a yellow rectangular region at (342, 140) spanning 84 by 30 pixels.
; PLAN: r0=342(x), r1=140(y), r2=84(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 140
LDI r2, 84
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
