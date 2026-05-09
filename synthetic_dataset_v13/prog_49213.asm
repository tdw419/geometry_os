; DESCRIPTION: Creates a yellow rectangular region at (385, 163) spanning 70 by 26 pixels.
; PLAN: r0=385(x), r1=163(y), r2=70(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 163
LDI r2, 70
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
