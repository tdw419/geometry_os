; DESCRIPTION: Creates a white rectangular region at (443, 45) spanning 34 by 17 pixels.
; PLAN: r0=443(x), r1=45(y), r2=34(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 45
LDI r2, 34
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
