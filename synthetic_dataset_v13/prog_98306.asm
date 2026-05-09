; DESCRIPTION: Creates a red rectangular region at (151, 94) spanning 14 by 115 pixels.
; PLAN: r0=151(x), r1=94(y), r2=14(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 94
LDI r2, 14
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
