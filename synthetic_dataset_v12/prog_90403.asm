; DESCRIPTION: Creates a black rectangular region at (91, 193) spanning 33 by 43 pixels.
; PLAN: r0=91(x), r1=193(y), r2=33(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 193
LDI r2, 33
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
