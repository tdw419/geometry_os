; DESCRIPTION: Creates a white rectangular region at (430, 78) spanning 65 by 36 pixels.
; PLAN: r0=430(x), r1=78(y), r2=65(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 78
LDI r2, 65
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
