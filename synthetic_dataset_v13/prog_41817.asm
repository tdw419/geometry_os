; DESCRIPTION: Creates a blue rectangular region at (13, 46) spanning 34 by 59 pixels.
; PLAN: r0=13(x), r1=46(y), r2=34(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 46
LDI r2, 34
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
