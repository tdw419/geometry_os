; DESCRIPTION: Creates a yellow rectangular region at (69, 138) spanning 44 by 29 pixels.
; PLAN: r0=69(x), r1=138(y), r2=44(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 138
LDI r2, 44
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
