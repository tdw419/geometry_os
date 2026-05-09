; DESCRIPTION: Creates a yellow rectangular region at (95, 113) spanning 115 by 47 pixels.
; PLAN: r0=95(x), r1=113(y), r2=115(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 113
LDI r2, 115
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
