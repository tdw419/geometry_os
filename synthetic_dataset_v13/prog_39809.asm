; DESCRIPTION: Creates a red rectangular region at (151, 190) spanning 34 by 46 pixels.
; PLAN: r0=151(x), r1=190(y), r2=34(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 190
LDI r2, 34
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
