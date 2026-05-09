; DESCRIPTION: Creates a black rectangular region at (199, 145) spanning 99 by 111 pixels.
; PLAN: r0=199(x), r1=145(y), r2=99(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 145
LDI r2, 99
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
