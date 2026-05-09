; DESCRIPTION: Creates a yellow rectangular region at (386, 38) spanning 29 by 35 pixels.
; PLAN: r0=386(x), r1=38(y), r2=29(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 38
LDI r2, 29
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
