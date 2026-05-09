; DESCRIPTION: Creates a black rectangular region at (357, 173) spanning 115 by 12 pixels.
; PLAN: r0=357(x), r1=173(y), r2=115(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 173
LDI r2, 115
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
