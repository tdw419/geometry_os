; DESCRIPTION: Creates a black rectangular region at (319, 54) spanning 75 by 21 pixels.
; PLAN: r0=319(x), r1=54(y), r2=75(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 54
LDI r2, 75
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
