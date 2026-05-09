; DESCRIPTION: Creates a red rectangular region at (341, 20) spanning 112 by 96 pixels.
; PLAN: r0=341(x), r1=20(y), r2=112(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 20
LDI r2, 112
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
