; DESCRIPTION: Creates a red rectangular region at (270, 163) spanning 110 by 25 pixels.
; PLAN: r0=270(x), r1=163(y), r2=110(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 163
LDI r2, 110
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
