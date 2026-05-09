; DESCRIPTION: Creates a red rectangular region at (25, 141) spanning 83 by 109 pixels.
; PLAN: r0=25(x), r1=141(y), r2=83(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 141
LDI r2, 83
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
