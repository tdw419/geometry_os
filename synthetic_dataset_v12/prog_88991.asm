; DESCRIPTION: Creates a white rectangular region at (365, 181) spanning 68 by 13 pixels.
; PLAN: r0=365(x), r1=181(y), r2=68(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 181
LDI r2, 68
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
