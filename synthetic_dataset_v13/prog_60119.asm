; DESCRIPTION: Creates a yellow rectangular region at (372, 78) spanning 17 by 13 pixels.
; PLAN: r0=372(x), r1=78(y), r2=17(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 78
LDI r2, 17
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
