; DESCRIPTION: Creates a red rectangular region at (68, 20) spanning 38 by 60 pixels.
; PLAN: r0=68(x), r1=20(y), r2=38(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 20
LDI r2, 38
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
