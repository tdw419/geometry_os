; DESCRIPTION: Creates a red rectangular region at (378, 33) spanning 34 by 109 pixels.
; PLAN: r0=378(x), r1=33(y), r2=34(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 33
LDI r2, 34
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
