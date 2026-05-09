; DESCRIPTION: Creates a white rectangular region at (378, 3) spanning 65 by 109 pixels.
; PLAN: r0=378(x), r1=3(y), r2=65(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 3
LDI r2, 65
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
