; DESCRIPTION: Creates a white rectangular region at (275, 71) spanning 11 by 23 pixels.
; PLAN: r0=275(x), r1=71(y), r2=11(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 71
LDI r2, 11
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
