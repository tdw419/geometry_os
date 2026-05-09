; DESCRIPTION: Creates a yellow rectangular region at (108, 60) spanning 92 by 73 pixels.
; PLAN: r0=108(x), r1=60(y), r2=92(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 60
LDI r2, 92
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
