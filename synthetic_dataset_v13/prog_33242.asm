; DESCRIPTION: Creates a blue rectangular region at (482, 199) spanning 21 by 33 pixels.
; PLAN: r0=482(x), r1=199(y), r2=21(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 199
LDI r2, 21
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
