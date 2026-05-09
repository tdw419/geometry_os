; DESCRIPTION: Creates a red rectangular region at (375, 3) spanning 98 by 78 pixels.
; PLAN: r0=375(x), r1=3(y), r2=98(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 3
LDI r2, 98
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
