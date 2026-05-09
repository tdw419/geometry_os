; DESCRIPTION: Creates a orange rectangular region at (441, 39) spanning 17 by 106 pixels.
; PLAN: r0=441(x), r1=39(y), r2=17(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 39
LDI r2, 17
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
