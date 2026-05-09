; DESCRIPTION: Creates a red rectangular region at (276, 125) spanning 36 by 25 pixels.
; PLAN: r0=276(x), r1=125(y), r2=36(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 125
LDI r2, 36
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
