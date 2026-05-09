; DESCRIPTION: Creates a red rectangular region at (140, 151) spanning 76 by 20 pixels.
; PLAN: r0=140(x), r1=151(y), r2=76(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 151
LDI r2, 76
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
