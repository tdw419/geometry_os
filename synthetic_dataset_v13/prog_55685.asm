; DESCRIPTION: Creates a green rectangular region at (381, 39) spanning 52 by 21 pixels.
; PLAN: r0=381(x), r1=39(y), r2=52(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 39
LDI r2, 52
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
