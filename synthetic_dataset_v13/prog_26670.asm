; DESCRIPTION: Creates a yellow rectangular region at (443, 115) spanning 33 by 102 pixels.
; PLAN: r0=443(x), r1=115(y), r2=33(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 115
LDI r2, 33
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
