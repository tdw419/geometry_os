; DESCRIPTION: Creates a red rectangular region at (102, 230) spanning 65 by 11 pixels.
; PLAN: r0=102(x), r1=230(y), r2=65(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 230
LDI r2, 65
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
