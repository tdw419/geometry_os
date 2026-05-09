; DESCRIPTION: Creates a black rectangular region at (246, 78) spanning 13 by 27 pixels.
; PLAN: r0=246(x), r1=78(y), r2=13(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 78
LDI r2, 13
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
