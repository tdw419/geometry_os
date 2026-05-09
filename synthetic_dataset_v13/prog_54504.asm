; DESCRIPTION: Creates a blue rectangular region at (177, 141) spanning 114 by 14 pixels.
; PLAN: r0=177(x), r1=141(y), r2=114(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 141
LDI r2, 114
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
