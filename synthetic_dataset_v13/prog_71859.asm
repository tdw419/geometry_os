; DESCRIPTION: Creates a blue rectangular region at (281, 35) spanning 114 by 46 pixels.
; PLAN: r0=281(x), r1=35(y), r2=114(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 35
LDI r2, 114
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
