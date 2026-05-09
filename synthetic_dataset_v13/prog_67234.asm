; DESCRIPTION: Creates a black rectangular region at (302, 25) spanning 71 by 39 pixels.
; PLAN: r0=302(x), r1=25(y), r2=71(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 25
LDI r2, 71
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
