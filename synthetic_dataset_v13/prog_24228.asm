; DESCRIPTION: Creates a black rectangular region at (70, 6) spanning 72 by 77 pixels.
; PLAN: r0=70(x), r1=6(y), r2=72(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 6
LDI r2, 72
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
