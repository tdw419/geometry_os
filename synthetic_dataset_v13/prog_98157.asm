; DESCRIPTION: Creates a white rectangular region at (378, 111) spanning 34 by 50 pixels.
; PLAN: r0=378(x), r1=111(y), r2=34(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 111
LDI r2, 34
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
