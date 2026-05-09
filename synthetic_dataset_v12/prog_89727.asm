; DESCRIPTION: Creates a red rectangular region at (104, 133) spanning 78 by 106 pixels.
; PLAN: r0=104(x), r1=133(y), r2=78(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 133
LDI r2, 78
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
