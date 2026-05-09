; DESCRIPTION: Creates a green rectangular region at (141, 199) spanning 28 by 55 pixels.
; PLAN: r0=141(x), r1=199(y), r2=28(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 199
LDI r2, 28
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
