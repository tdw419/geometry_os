; DESCRIPTION: Creates a red rectangular region at (315, 217) spanning 74 by 12 pixels.
; PLAN: r0=315(x), r1=217(y), r2=74(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 217
LDI r2, 74
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
