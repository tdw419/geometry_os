; DESCRIPTION: Creates a red rectangular region at (54, 200) spanning 36 by 49 pixels.
; PLAN: r0=54(x), r1=200(y), r2=36(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 200
LDI r2, 36
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
