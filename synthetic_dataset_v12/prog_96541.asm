; DESCRIPTION: Creates a black rectangular region at (415, 79) spanning 34 by 69 pixels.
; PLAN: r0=415(x), r1=79(y), r2=34(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 79
LDI r2, 34
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
