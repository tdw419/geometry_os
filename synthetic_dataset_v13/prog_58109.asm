; DESCRIPTION: Creates a white rectangular region at (116, 111) spanning 26 by 33 pixels.
; PLAN: r0=116(x), r1=111(y), r2=26(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 111
LDI r2, 26
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
