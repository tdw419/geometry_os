; DESCRIPTION: Creates a yellow rectangular region at (310, 178) spanning 102 by 56 pixels.
; PLAN: r0=310(x), r1=178(y), r2=102(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 178
LDI r2, 102
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
