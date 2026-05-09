; DESCRIPTION: Creates a yellow rectangular region at (233, 131) spanning 59 by 108 pixels.
; PLAN: r0=233(x), r1=131(y), r2=59(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 131
LDI r2, 59
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
