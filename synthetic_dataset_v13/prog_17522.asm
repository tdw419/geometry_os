; DESCRIPTION: Creates a red rectangular region at (40, 20) spanning 58 by 65 pixels.
; PLAN: r0=40(x), r1=20(y), r2=58(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 20
LDI r2, 58
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
