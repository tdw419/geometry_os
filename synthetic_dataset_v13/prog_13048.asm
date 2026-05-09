; DESCRIPTION: Creates a yellow rectangular region at (407, 171) spanning 37 by 64 pixels.
; PLAN: r0=407(x), r1=171(y), r2=37(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 171
LDI r2, 37
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
