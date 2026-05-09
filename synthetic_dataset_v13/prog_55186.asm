; DESCRIPTION: Creates a red rectangular region at (120, 13) spanning 118 by 19 pixels.
; PLAN: r0=120(x), r1=13(y), r2=118(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 13
LDI r2, 118
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
