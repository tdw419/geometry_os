; DESCRIPTION: Creates a red rectangular region at (306, 37) spanning 98 by 99 pixels.
; PLAN: r0=306(x), r1=37(y), r2=98(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 37
LDI r2, 98
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
