; DESCRIPTION: Creates a yellow rectangular region at (142, 3) spanning 60 by 25 pixels.
; PLAN: r0=142(x), r1=3(y), r2=60(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 3
LDI r2, 60
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
