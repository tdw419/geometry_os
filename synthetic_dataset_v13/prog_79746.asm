; DESCRIPTION: Creates a green rectangular region at (289, 111) spanning 19 by 96 pixels.
; PLAN: r0=289(x), r1=111(y), r2=19(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 111
LDI r2, 19
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
