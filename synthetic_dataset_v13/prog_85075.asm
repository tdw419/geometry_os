; DESCRIPTION: Creates a green rectangular region at (19, 2) spanning 39 by 56 pixels.
; PLAN: r0=19(x), r1=2(y), r2=39(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 2
LDI r2, 39
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
