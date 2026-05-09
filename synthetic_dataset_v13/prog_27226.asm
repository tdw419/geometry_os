; DESCRIPTION: Creates a yellow rectangular region at (382, 162) spanning 31 by 59 pixels.
; PLAN: r0=382(x), r1=162(y), r2=31(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 162
LDI r2, 31
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
