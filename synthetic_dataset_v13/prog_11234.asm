; DESCRIPTION: Creates a blue rectangular region at (286, 138) spanning 74 by 83 pixels.
; PLAN: r0=286(x), r1=138(y), r2=74(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 138
LDI r2, 74
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
