; DESCRIPTION: Creates a black rectangular region at (359, 111) spanning 59 by 39 pixels.
; PLAN: r0=359(x), r1=111(y), r2=59(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 111
LDI r2, 59
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
