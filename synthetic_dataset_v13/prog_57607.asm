; DESCRIPTION: Creates a red rectangular region at (58, 132) spanning 59 by 108 pixels.
; PLAN: r0=58(x), r1=132(y), r2=59(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 132
LDI r2, 59
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
