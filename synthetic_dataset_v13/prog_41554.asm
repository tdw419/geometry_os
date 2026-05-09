; DESCRIPTION: Creates a white rectangular region at (111, 83) spanning 98 by 74 pixels.
; PLAN: r0=111(x), r1=83(y), r2=98(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 83
LDI r2, 98
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
