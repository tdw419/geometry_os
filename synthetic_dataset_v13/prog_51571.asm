; DESCRIPTION: Creates a yellow rectangular region at (140, 114) spanning 108 by 16 pixels.
; PLAN: r0=140(x), r1=114(y), r2=108(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 114
LDI r2, 108
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
