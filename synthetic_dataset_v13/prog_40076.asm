; DESCRIPTION: Creates a white rectangular region at (347, 143) spanning 37 by 43 pixels.
; PLAN: r0=347(x), r1=143(y), r2=37(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 143
LDI r2, 37
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
