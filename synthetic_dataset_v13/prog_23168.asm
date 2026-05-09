; DESCRIPTION: Creates a blue rectangular region at (148, 166) spanning 73 by 17 pixels.
; PLAN: r0=148(x), r1=166(y), r2=73(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 166
LDI r2, 73
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
