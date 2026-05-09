; DESCRIPTION: Creates a black rectangular region at (240, 33) spanning 111 by 31 pixels.
; PLAN: r0=240(x), r1=33(y), r2=111(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 33
LDI r2, 111
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
