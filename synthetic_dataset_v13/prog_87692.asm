; DESCRIPTION: Creates a yellow rectangular region at (159, 31) spanning 65 by 70 pixels.
; PLAN: r0=159(x), r1=31(y), r2=65(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 31
LDI r2, 65
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
