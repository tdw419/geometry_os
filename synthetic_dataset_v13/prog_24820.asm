; DESCRIPTION: Creates a white rectangular region at (140, 74) spanning 47 by 18 pixels.
; PLAN: r0=140(x), r1=74(y), r2=47(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 74
LDI r2, 47
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
