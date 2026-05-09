; DESCRIPTION: Creates a green rectangular region at (347, 13) spanning 90 by 107 pixels.
; PLAN: r0=347(x), r1=13(y), r2=90(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 13
LDI r2, 90
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
