; DESCRIPTION: Creates a white rectangular region at (99, 90) spanning 12 by 57 pixels.
; PLAN: r0=99(x), r1=90(y), r2=12(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 90
LDI r2, 12
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
