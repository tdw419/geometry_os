; DESCRIPTION: Creates a white rectangular region at (363, 87) spanning 23 by 25 pixels.
; PLAN: r0=363(x), r1=87(y), r2=23(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 87
LDI r2, 23
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
