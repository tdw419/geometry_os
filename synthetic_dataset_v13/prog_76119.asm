; DESCRIPTION: Creates a white rectangular region at (359, 113) spanning 50 by 46 pixels.
; PLAN: r0=359(x), r1=113(y), r2=50(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 113
LDI r2, 50
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
