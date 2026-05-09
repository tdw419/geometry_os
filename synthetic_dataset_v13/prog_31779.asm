; DESCRIPTION: Creates a black rectangular region at (33, 75) spanning 29 by 61 pixels.
; PLAN: r0=33(x), r1=75(y), r2=29(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 75
LDI r2, 29
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
