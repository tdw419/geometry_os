; DESCRIPTION: Creates a red rectangular region at (164, 54) spanning 38 by 99 pixels.
; PLAN: r0=164(x), r1=54(y), r2=38(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 54
LDI r2, 38
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
