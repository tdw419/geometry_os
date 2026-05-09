; DESCRIPTION: Creates a yellow rectangular region at (204, 87) spanning 111 by 31 pixels.
; PLAN: r0=204(x), r1=87(y), r2=111(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 87
LDI r2, 111
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
