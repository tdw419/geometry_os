; DESCRIPTION: Creates a white rectangular region at (351, 21) spanning 45 by 23 pixels.
; PLAN: r0=351(x), r1=21(y), r2=45(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 21
LDI r2, 45
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
