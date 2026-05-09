; DESCRIPTION: Creates a green rectangular region at (303, 143) spanning 41 by 57 pixels.
; PLAN: r0=303(x), r1=143(y), r2=41(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 143
LDI r2, 41
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
