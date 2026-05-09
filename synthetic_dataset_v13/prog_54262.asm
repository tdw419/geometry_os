; DESCRIPTION: Creates a red rectangular region at (467, 31) spanning 25 by 108 pixels.
; PLAN: r0=467(x), r1=31(y), r2=25(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 31
LDI r2, 25
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
