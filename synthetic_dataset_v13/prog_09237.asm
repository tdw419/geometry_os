; DESCRIPTION: Creates a yellow rectangular region at (304, 59) spanning 100 by 111 pixels.
; PLAN: r0=304(x), r1=59(y), r2=100(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 59
LDI r2, 100
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
