; DESCRIPTION: Creates a yellow rectangular region at (234, 5) spanning 89 by 59 pixels.
; PLAN: r0=234(x), r1=5(y), r2=89(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 5
LDI r2, 89
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
