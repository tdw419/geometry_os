; DESCRIPTION: Creates a red rectangular region at (211, 60) spanning 98 by 34 pixels.
; PLAN: r0=211(x), r1=60(y), r2=98(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 60
LDI r2, 98
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
