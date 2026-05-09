; DESCRIPTION: Creates a red rectangular region at (344, 12) spanning 114 by 51 pixels.
; PLAN: r0=344(x), r1=12(y), r2=114(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 12
LDI r2, 114
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
