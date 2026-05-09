; DESCRIPTION: Creates a magenta rectangular region at (344, 190) spanning 62 by 41 pixels.
; PLAN: r0=344(x), r1=190(y), r2=62(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 190
LDI r2, 62
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
