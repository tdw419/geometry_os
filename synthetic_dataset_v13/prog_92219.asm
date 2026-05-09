; DESCRIPTION: Creates a red rectangular region at (21, 200) spanning 54 by 14 pixels.
; PLAN: r0=21(x), r1=200(y), r2=54(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 200
LDI r2, 54
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
