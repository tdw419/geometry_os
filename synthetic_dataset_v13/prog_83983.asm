; DESCRIPTION: Creates a green rectangular region at (381, 18) spanning 40 by 39 pixels.
; PLAN: r0=381(x), r1=18(y), r2=40(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 18
LDI r2, 40
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
