; DESCRIPTION: Creates a white rectangular region at (261, 99) spanning 48 by 19 pixels.
; PLAN: r0=261(x), r1=99(y), r2=48(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 99
LDI r2, 48
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
