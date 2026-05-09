; DESCRIPTION: Creates a red rectangular region at (153, 29) spanning 113 by 92 pixels.
; PLAN: r0=153(x), r1=29(y), r2=113(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 29
LDI r2, 113
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
