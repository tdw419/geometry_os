; DESCRIPTION: Creates a red rectangular region at (443, 78) spanning 57 by 70 pixels.
; PLAN: r0=443(x), r1=78(y), r2=57(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 78
LDI r2, 57
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
