; DESCRIPTION: Creates a red rectangular region at (332, 153) spanning 106 by 50 pixels.
; PLAN: r0=332(x), r1=153(y), r2=106(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 153
LDI r2, 106
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
