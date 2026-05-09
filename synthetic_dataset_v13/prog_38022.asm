; DESCRIPTION: Creates a yellow rectangular region at (92, 132) spanning 11 by 97 pixels.
; PLAN: r0=92(x), r1=132(y), r2=11(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 132
LDI r2, 11
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
