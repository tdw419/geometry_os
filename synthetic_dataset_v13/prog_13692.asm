; DESCRIPTION: Creates a red rectangular region at (117, 115) spanning 66 by 65 pixels.
; PLAN: r0=117(x), r1=115(y), r2=66(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 115
LDI r2, 66
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
