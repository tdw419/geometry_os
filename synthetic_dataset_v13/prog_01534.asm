; DESCRIPTION: Creates a black rectangular region at (240, 19) spanning 14 by 59 pixels.
; PLAN: r0=240(x), r1=19(y), r2=14(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 19
LDI r2, 14
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
