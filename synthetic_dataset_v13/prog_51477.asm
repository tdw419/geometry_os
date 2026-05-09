; DESCRIPTION: Creates a red rectangular region at (301, 24) spanning 25 by 85 pixels.
; PLAN: r0=301(x), r1=24(y), r2=25(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 24
LDI r2, 25
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
