; DESCRIPTION: Creates a black rectangular region at (145, 9) spanning 111 by 52 pixels.
; PLAN: r0=145(x), r1=9(y), r2=111(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 9
LDI r2, 111
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
