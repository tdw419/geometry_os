; DESCRIPTION: Creates a white rectangular region at (486, 143) spanning 25 by 44 pixels.
; PLAN: r0=486(x), r1=143(y), r2=25(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 143
LDI r2, 25
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
