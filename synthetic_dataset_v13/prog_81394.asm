; DESCRIPTION: Creates a yellow rectangular region at (144, 5) spanning 33 by 111 pixels.
; PLAN: r0=144(x), r1=5(y), r2=33(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 5
LDI r2, 33
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
