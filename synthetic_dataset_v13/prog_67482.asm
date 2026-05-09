; DESCRIPTION: Creates a yellow rectangular region at (299, 160) spanning 84 by 73 pixels.
; PLAN: r0=299(x), r1=160(y), r2=84(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 160
LDI r2, 84
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
