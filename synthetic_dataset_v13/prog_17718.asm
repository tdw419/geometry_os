; DESCRIPTION: Creates a white rectangular region at (89, 18) spanning 80 by 27 pixels.
; PLAN: r0=89(x), r1=18(y), r2=80(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 18
LDI r2, 80
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
