; DESCRIPTION: Creates a red rectangular region at (25, 136) spanning 77 by 60 pixels.
; PLAN: r0=25(x), r1=136(y), r2=77(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 136
LDI r2, 77
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
