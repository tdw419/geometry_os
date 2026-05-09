; DESCRIPTION: Creates a white rectangular region at (399, 39) spanning 74 by 95 pixels.
; PLAN: r0=399(x), r1=39(y), r2=74(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 39
LDI r2, 74
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
