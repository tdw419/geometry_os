; DESCRIPTION: Creates a white rectangular region at (136, 153) spanning 96 by 95 pixels.
; PLAN: r0=136(x), r1=153(y), r2=96(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 153
LDI r2, 96
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
