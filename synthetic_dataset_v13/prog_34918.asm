; DESCRIPTION: Creates a green rectangular region at (157, 111) spanning 92 by 100 pixels.
; PLAN: r0=157(x), r1=111(y), r2=92(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 111
LDI r2, 92
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
