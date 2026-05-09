; DESCRIPTION: Creates a red rectangular region at (166, 176) spanning 37 by 78 pixels.
; PLAN: r0=166(x), r1=176(y), r2=37(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 176
LDI r2, 37
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
