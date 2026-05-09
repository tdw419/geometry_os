; DESCRIPTION: Creates a red rectangular region at (319, 77) spanning 75 by 50 pixels.
; PLAN: r0=319(x), r1=77(y), r2=75(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 77
LDI r2, 75
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
