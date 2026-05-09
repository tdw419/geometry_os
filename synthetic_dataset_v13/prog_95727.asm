; DESCRIPTION: Creates a white rectangular region at (406, 89) spanning 99 by 90 pixels.
; PLAN: r0=406(x), r1=89(y), r2=99(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 89
LDI r2, 99
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
