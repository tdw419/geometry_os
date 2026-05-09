; DESCRIPTION: Creates a white rectangular region at (109, 113) spanning 120 by 98 pixels.
; PLAN: r0=109(x), r1=113(y), r2=120(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 113
LDI r2, 120
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
