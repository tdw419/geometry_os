; DESCRIPTION: Creates a blue rectangular region at (286, 138) spanning 92 by 52 pixels.
; PLAN: r0=286(x), r1=138(y), r2=92(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 138
LDI r2, 92
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
