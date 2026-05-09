; DESCRIPTION: Creates a red rectangular region at (303, 35) spanning 98 by 116 pixels.
; PLAN: r0=303(x), r1=35(y), r2=98(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 35
LDI r2, 98
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
