; DESCRIPTION: Creates a yellow rectangular region at (421, 91) spanning 37 by 116 pixels.
; PLAN: r0=421(x), r1=91(y), r2=37(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 91
LDI r2, 37
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
