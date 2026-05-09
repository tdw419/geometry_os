; DESCRIPTION: Creates a white rectangular region at (185, 85) spanning 94 by 77 pixels.
; PLAN: r0=185(x), r1=85(y), r2=94(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 85
LDI r2, 94
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
