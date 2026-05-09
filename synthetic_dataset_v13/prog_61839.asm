; DESCRIPTION: Creates a yellow rectangular region at (100, 180) spanning 112 by 11 pixels.
; PLAN: r0=100(x), r1=180(y), r2=112(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 180
LDI r2, 112
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
