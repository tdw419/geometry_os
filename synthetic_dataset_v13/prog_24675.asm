; DESCRIPTION: Creates a red rectangular region at (85, 202) spanning 53 by 54 pixels.
; PLAN: r0=85(x), r1=202(y), r2=53(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 202
LDI r2, 53
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
