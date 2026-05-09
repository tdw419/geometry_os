; DESCRIPTION: Creates a red rectangular region at (186, 46) spanning 108 by 115 pixels.
; PLAN: r0=186(x), r1=46(y), r2=108(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 46
LDI r2, 108
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
