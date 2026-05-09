; DESCRIPTION: Creates a black rectangular region at (210, 148) spanning 106 by 55 pixels.
; PLAN: r0=210(x), r1=148(y), r2=106(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 148
LDI r2, 106
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
