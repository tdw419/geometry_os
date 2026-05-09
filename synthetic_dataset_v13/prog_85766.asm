; DESCRIPTION: Creates a red rectangular region at (213, 6) spanning 106 by 112 pixels.
; PLAN: r0=213(x), r1=6(y), r2=106(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 6
LDI r2, 106
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
