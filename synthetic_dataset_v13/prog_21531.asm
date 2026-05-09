; DESCRIPTION: Creates a yellow rectangular region at (371, 64) spanning 33 by 29 pixels.
; PLAN: r0=371(x), r1=64(y), r2=33(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 64
LDI r2, 33
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
