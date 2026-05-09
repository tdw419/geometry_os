; DESCRIPTION: Creates a yellow rectangular region at (230, 44) spanning 76 by 114 pixels.
; PLAN: r0=230(x), r1=44(y), r2=76(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 44
LDI r2, 76
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
