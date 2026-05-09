; DESCRIPTION: Creates a red rectangular region at (98, 189) spanning 88 by 25 pixels.
; PLAN: r0=98(x), r1=189(y), r2=88(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 189
LDI r2, 88
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
