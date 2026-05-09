; DESCRIPTION: Creates a red rectangular region at (329, 75) spanning 98 by 106 pixels.
; PLAN: r0=329(x), r1=75(y), r2=98(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 75
LDI r2, 98
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
