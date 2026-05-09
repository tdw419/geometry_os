; DESCRIPTION: Creates a black rectangular region at (395, 31) spanning 111 by 104 pixels.
; PLAN: r0=395(x), r1=31(y), r2=111(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 31
LDI r2, 111
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
