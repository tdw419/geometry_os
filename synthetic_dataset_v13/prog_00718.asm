; DESCRIPTION: Creates a yellow rectangular region at (444, 72) spanning 40 by 34 pixels.
; PLAN: r0=444(x), r1=72(y), r2=40(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 72
LDI r2, 40
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
