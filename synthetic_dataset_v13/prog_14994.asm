; DESCRIPTION: Creates a red rectangular region at (119, 159) spanning 36 by 13 pixels.
; PLAN: r0=119(x), r1=159(y), r2=36(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 159
LDI r2, 36
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
