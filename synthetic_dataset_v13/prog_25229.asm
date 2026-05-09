; DESCRIPTION: Creates a black rectangular region at (441, 138) spanning 66 by 42 pixels.
; PLAN: r0=441(x), r1=138(y), r2=66(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 138
LDI r2, 66
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
