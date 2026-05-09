; DESCRIPTION: Creates a orange rectangular region at (232, 90) spanning 77 by 80 pixels.
; PLAN: r0=232(x), r1=90(y), r2=77(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 90
LDI r2, 77
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
