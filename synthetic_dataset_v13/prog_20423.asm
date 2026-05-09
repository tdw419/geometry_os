; DESCRIPTION: Creates a white rectangular region at (17, 24) spanning 95 by 98 pixels.
; PLAN: r0=17(x), r1=24(y), r2=95(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 24
LDI r2, 95
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
