; DESCRIPTION: Creates a yellow rectangular region at (465, 14) spanning 34 by 91 pixels.
; PLAN: r0=465(x), r1=14(y), r2=34(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 14
LDI r2, 34
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
