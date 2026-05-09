; DESCRIPTION: Creates a red rectangular region at (443, 102) spanning 30 by 105 pixels.
; PLAN: r0=443(x), r1=102(y), r2=30(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 102
LDI r2, 30
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
