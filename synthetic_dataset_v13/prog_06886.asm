; DESCRIPTION: Creates a black rectangular region at (140, 170) spanning 90 by 25 pixels.
; PLAN: r0=140(x), r1=170(y), r2=90(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 170
LDI r2, 90
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
