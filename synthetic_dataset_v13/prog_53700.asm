; DESCRIPTION: Creates a white rectangular region at (193, 43) spanning 38 by 107 pixels.
; PLAN: r0=193(x), r1=43(y), r2=38(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 43
LDI r2, 38
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
