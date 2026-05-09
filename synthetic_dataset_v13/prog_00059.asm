; DESCRIPTION: Creates a black rectangular region at (309, 20) spanning 23 by 59 pixels.
; PLAN: r0=309(x), r1=20(y), r2=23(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 20
LDI r2, 23
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
