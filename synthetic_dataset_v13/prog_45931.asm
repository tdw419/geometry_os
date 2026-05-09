; DESCRIPTION: Creates a yellow rectangular region at (482, 32) spanning 14 by 48 pixels.
; PLAN: r0=482(x), r1=32(y), r2=14(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 32
LDI r2, 14
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
