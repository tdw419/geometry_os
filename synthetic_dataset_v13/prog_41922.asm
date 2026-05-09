; DESCRIPTION: Creates a yellow rectangular region at (44, 38) spanning 32 by 32 pixels.
; PLAN: r0=44(x), r1=38(y), r2=32(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 38
LDI r2, 32
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
