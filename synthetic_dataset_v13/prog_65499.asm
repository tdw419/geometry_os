; DESCRIPTION: Creates a red rectangular region at (11, 3) spanning 113 by 112 pixels.
; PLAN: r0=11(x), r1=3(y), r2=113(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 3
LDI r2, 113
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
