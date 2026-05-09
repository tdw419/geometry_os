; DESCRIPTION: Creates a yellow rectangular region at (165, 37) spanning 17 by 69 pixels.
; PLAN: r0=165(x), r1=37(y), r2=17(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 37
LDI r2, 17
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
