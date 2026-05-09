; DESCRIPTION: Creates a red rectangular region at (332, 159) spanning 85 by 29 pixels.
; PLAN: r0=332(x), r1=159(y), r2=85(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 159
LDI r2, 85
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
