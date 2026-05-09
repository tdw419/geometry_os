; DESCRIPTION: Creates a blue rectangular region at (199, 138) spanning 108 by 116 pixels.
; PLAN: r0=199(x), r1=138(y), r2=108(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 138
LDI r2, 108
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
