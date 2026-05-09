; DESCRIPTION: Creates a white rectangular region at (443, 118) spanning 40 by 57 pixels.
; PLAN: r0=443(x), r1=118(y), r2=40(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 118
LDI r2, 40
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
