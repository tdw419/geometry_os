; DESCRIPTION: Creates a red rectangular region at (427, 46) spanning 77 by 47 pixels.
; PLAN: r0=427(x), r1=46(y), r2=77(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 46
LDI r2, 77
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
