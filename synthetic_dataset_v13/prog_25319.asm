; DESCRIPTION: Creates a black rectangular region at (18, 77) spanning 21 by 60 pixels.
; PLAN: r0=18(x), r1=77(y), r2=21(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 77
LDI r2, 21
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
