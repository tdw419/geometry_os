; DESCRIPTION: Creates a yellow rectangular region at (211, 233) spanning 111 by 11 pixels.
; PLAN: r0=211(x), r1=233(y), r2=111(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 233
LDI r2, 111
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
