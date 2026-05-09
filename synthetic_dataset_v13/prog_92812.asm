; DESCRIPTION: Creates a black rectangular region at (44, 38) spanning 79 by 28 pixels.
; PLAN: r0=44(x), r1=38(y), r2=79(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 38
LDI r2, 79
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
