; DESCRIPTION: Creates a white rectangular region at (482, 123) spanning 22 by 111 pixels.
; PLAN: r0=482(x), r1=123(y), r2=22(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 123
LDI r2, 22
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
