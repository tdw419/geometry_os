; DESCRIPTION: Creates a red rectangular region at (204, 151) spanning 26 by 79 pixels.
; PLAN: r0=204(x), r1=151(y), r2=26(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 151
LDI r2, 26
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
