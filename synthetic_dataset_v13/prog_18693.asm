; DESCRIPTION: Creates a red rectangular region at (425, 85) spanning 15 by 117 pixels.
; PLAN: r0=425(x), r1=85(y), r2=15(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 85
LDI r2, 15
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
