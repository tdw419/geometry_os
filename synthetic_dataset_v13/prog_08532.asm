; DESCRIPTION: Creates a yellow rectangular region at (388, 168) spanning 114 by 65 pixels.
; PLAN: r0=388(x), r1=168(y), r2=114(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 168
LDI r2, 114
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
