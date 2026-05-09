; DESCRIPTION: Creates a red rectangular region at (43, 28) spanning 62 by 54 pixels.
; PLAN: r0=43(x), r1=28(y), r2=62(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 28
LDI r2, 62
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
