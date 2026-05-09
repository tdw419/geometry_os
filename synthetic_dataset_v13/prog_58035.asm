; DESCRIPTION: Creates a red rectangular region at (341, 127) spanning 35 by 79 pixels.
; PLAN: r0=341(x), r1=127(y), r2=35(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 127
LDI r2, 35
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
