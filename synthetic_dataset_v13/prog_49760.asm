; DESCRIPTION: Creates a white rectangular region at (240, 92) spanning 119 by 50 pixels.
; PLAN: r0=240(x), r1=92(y), r2=119(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 92
LDI r2, 119
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
