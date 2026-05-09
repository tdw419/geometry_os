; DESCRIPTION: Creates a white rectangular region at (77, 65) spanning 22 by 107 pixels.
; PLAN: r0=77(x), r1=65(y), r2=22(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 65
LDI r2, 22
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
