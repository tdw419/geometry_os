; DESCRIPTION: Creates a black rectangular region at (275, 79) spanning 114 by 75 pixels.
; PLAN: r0=275(x), r1=79(y), r2=114(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 79
LDI r2, 114
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
