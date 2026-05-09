; DESCRIPTION: Creates a black rectangular region at (415, 55) spanning 83 by 29 pixels.
; PLAN: r0=415(x), r1=55(y), r2=83(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 55
LDI r2, 83
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
