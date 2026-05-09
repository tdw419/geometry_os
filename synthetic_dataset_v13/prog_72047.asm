; DESCRIPTION: Creates a red rectangular region at (300, 113) spanning 83 by 44 pixels.
; PLAN: r0=300(x), r1=113(y), r2=83(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 113
LDI r2, 83
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
