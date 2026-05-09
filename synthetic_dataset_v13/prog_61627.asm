; DESCRIPTION: Creates a yellow rectangular region at (382, 94) spanning 77 by 100 pixels.
; PLAN: r0=382(x), r1=94(y), r2=77(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 94
LDI r2, 77
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
