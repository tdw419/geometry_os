; DESCRIPTION: Creates a yellow rectangular region at (149, 84) spanning 113 by 47 pixels.
; PLAN: r0=149(x), r1=84(y), r2=113(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 84
LDI r2, 113
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
