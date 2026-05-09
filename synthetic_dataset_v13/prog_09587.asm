; DESCRIPTION: Creates a red rectangular region at (378, 173) spanning 35 by 14 pixels.
; PLAN: r0=378(x), r1=173(y), r2=35(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 173
LDI r2, 35
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
