; DESCRIPTION: Creates a yellow rectangular region at (196, 138) spanning 14 by 44 pixels.
; PLAN: r0=196(x), r1=138(y), r2=14(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 138
LDI r2, 14
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
