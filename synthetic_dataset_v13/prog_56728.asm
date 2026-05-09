; DESCRIPTION: Creates a yellow rectangular region at (121, 90) spanning 10 by 91 pixels.
; PLAN: r0=121(x), r1=90(y), r2=10(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 90
LDI r2, 10
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
