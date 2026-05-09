; DESCRIPTION: Creates a yellow rectangular region at (39, 169) spanning 71 by 38 pixels.
; PLAN: r0=39(x), r1=169(y), r2=71(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 169
LDI r2, 71
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
