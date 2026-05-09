; DESCRIPTION: Creates a green rectangular region at (289, 171) spanning 63 by 37 pixels.
; PLAN: r0=289(x), r1=171(y), r2=63(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 171
LDI r2, 63
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
