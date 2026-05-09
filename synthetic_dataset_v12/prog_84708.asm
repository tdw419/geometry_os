; DESCRIPTION: Creates a red rectangular region at (157, 39) spanning 12 by 20 pixels.
; PLAN: r0=157(x), r1=39(y), r2=12(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 39
LDI r2, 12
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
