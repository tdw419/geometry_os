; DESCRIPTION: Creates a red rectangular region at (403, 127) spanning 100 by 96 pixels.
; PLAN: r0=403(x), r1=127(y), r2=100(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 127
LDI r2, 100
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
