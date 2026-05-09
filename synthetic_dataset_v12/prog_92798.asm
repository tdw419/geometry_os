; DESCRIPTION: Creates a black rectangular region at (247, 76) spanning 68 by 77 pixels.
; PLAN: r0=247(x), r1=76(y), r2=68(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 76
LDI r2, 68
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
