; DESCRIPTION: Creates a black rectangular region at (225, 59) spanning 17 by 83 pixels.
; PLAN: r0=225(x), r1=59(y), r2=17(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 59
LDI r2, 17
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
