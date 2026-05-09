; DESCRIPTION: Creates a red rectangular region at (26, 171) spanning 54 by 35 pixels.
; PLAN: r0=26(x), r1=171(y), r2=54(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 171
LDI r2, 54
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
