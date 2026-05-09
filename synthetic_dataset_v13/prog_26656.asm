; DESCRIPTION: Creates a yellow rectangular region at (45, 10) spanning 34 by 17 pixels.
; PLAN: r0=45(x), r1=10(y), r2=34(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 10
LDI r2, 34
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
