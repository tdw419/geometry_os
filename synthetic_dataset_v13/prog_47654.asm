; DESCRIPTION: Creates a black rectangular region at (218, 145) spanning 44 by 105 pixels.
; PLAN: r0=218(x), r1=145(y), r2=44(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 145
LDI r2, 44
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
