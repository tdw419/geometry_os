; DESCRIPTION: Creates a red rectangular region at (303, 110) spanning 27 by 76 pixels.
; PLAN: r0=303(x), r1=110(y), r2=27(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 110
LDI r2, 27
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
