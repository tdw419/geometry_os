; DESCRIPTION: Creates a blue rectangular region at (306, 203) spanning 46 by 44 pixels.
; PLAN: r0=306(x), r1=203(y), r2=46(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 203
LDI r2, 46
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
