; DESCRIPTION: Creates a yellow rectangular region at (249, 160) spanning 59 by 84 pixels.
; PLAN: r0=249(x), r1=160(y), r2=59(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 160
LDI r2, 59
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
