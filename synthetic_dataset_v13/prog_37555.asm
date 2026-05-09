; DESCRIPTION: Creates a purple rectangular region at (443, 35) spanning 38 by 105 pixels.
; PLAN: r0=443(x), r1=35(y), r2=38(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 35
LDI r2, 38
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
