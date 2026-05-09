; DESCRIPTION: Creates a white rectangular region at (302, 113) spanning 95 by 118 pixels.
; PLAN: r0=302(x), r1=113(y), r2=95(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 113
LDI r2, 95
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
