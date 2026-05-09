; DESCRIPTION: Creates a black rectangular region at (110, 171) spanning 61 by 68 pixels.
; PLAN: r0=110(x), r1=171(y), r2=61(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 171
LDI r2, 61
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
