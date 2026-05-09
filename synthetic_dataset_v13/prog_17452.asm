; DESCRIPTION: Creates a black rectangular region at (283, 121) spanning 27 by 75 pixels.
; PLAN: r0=283(x), r1=121(y), r2=27(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 121
LDI r2, 27
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
