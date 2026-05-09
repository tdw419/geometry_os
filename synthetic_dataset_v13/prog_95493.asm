; DESCRIPTION: Creates a yellow rectangular region at (58, 39) spanning 38 by 59 pixels.
; PLAN: r0=58(x), r1=39(y), r2=38(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 39
LDI r2, 38
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
