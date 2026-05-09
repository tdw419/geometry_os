; DESCRIPTION: Creates a yellow rectangular region at (135, 99) spanning 59 by 95 pixels.
; PLAN: r0=135(x), r1=99(y), r2=59(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 99
LDI r2, 59
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
