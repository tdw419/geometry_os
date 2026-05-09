; DESCRIPTION: Creates a red rectangular region at (118, 97) spanning 86 by 95 pixels.
; PLAN: r0=118(x), r1=97(y), r2=86(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 97
LDI r2, 86
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
