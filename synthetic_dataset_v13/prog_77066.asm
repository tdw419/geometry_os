; DESCRIPTION: Creates a red rectangular region at (305, 127) spanning 95 by 114 pixels.
; PLAN: r0=305(x), r1=127(y), r2=95(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 127
LDI r2, 95
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
