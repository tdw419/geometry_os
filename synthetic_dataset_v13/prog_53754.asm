; DESCRIPTION: Creates a white rectangular region at (43, 195) spanning 17 by 38 pixels.
; PLAN: r0=43(x), r1=195(y), r2=17(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 195
LDI r2, 17
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
