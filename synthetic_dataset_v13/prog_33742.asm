; DESCRIPTION: Creates a white rectangular region at (216, 89) spanning 40 by 77 pixels.
; PLAN: r0=216(x), r1=89(y), r2=40(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 89
LDI r2, 40
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
