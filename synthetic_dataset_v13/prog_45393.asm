; DESCRIPTION: Creates a red rectangular region at (221, 134) spanning 55 by 113 pixels.
; PLAN: r0=221(x), r1=134(y), r2=55(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 134
LDI r2, 55
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
