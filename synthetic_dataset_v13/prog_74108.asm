; DESCRIPTION: Creates a yellow rectangular region at (289, 146) spanning 84 by 23 pixels.
; PLAN: r0=289(x), r1=146(y), r2=84(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 146
LDI r2, 84
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
