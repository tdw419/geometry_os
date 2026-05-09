; DESCRIPTION: Creates a green rectangular region at (167, 148) spanning 95 by 55 pixels.
; PLAN: r0=167(x), r1=148(y), r2=95(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 148
LDI r2, 95
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
