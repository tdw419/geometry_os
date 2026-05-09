; DESCRIPTION: Creates a yellow rectangular region at (188, 194) spanning 80 by 55 pixels.
; PLAN: r0=188(x), r1=194(y), r2=80(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 194
LDI r2, 80
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
