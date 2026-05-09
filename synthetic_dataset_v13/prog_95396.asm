; DESCRIPTION: Creates a white rectangular region at (363, 10) spanning 105 by 26 pixels.
; PLAN: r0=363(x), r1=10(y), r2=105(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 10
LDI r2, 105
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
