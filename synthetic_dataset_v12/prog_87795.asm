; DESCRIPTION: Creates a white rectangular region at (86, 234) spanning 77 by 20 pixels.
; PLAN: r0=86(x), r1=234(y), r2=77(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 234
LDI r2, 77
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
