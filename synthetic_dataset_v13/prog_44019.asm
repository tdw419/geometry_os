; DESCRIPTION: Creates a white rectangular region at (378, 149) spanning 67 by 61 pixels.
; PLAN: r0=378(x), r1=149(y), r2=67(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 149
LDI r2, 67
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
