; DESCRIPTION: Creates a yellow rectangular region at (34, 151) spanning 28 by 59 pixels.
; PLAN: r0=34(x), r1=151(y), r2=28(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 151
LDI r2, 28
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
