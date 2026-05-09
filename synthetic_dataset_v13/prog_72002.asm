; DESCRIPTION: Creates a black rectangular region at (406, 40) spanning 98 by 97 pixels.
; PLAN: r0=406(x), r1=40(y), r2=98(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 40
LDI r2, 98
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
