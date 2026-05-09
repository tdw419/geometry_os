; DESCRIPTION: Creates a red rectangular region at (171, 57) spanning 40 by 106 pixels.
; PLAN: r0=171(x), r1=57(y), r2=40(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 57
LDI r2, 40
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
