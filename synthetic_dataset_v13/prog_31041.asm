; DESCRIPTION: Creates a yellow rectangular region at (22, 112) spanning 81 by 50 pixels.
; PLAN: r0=22(x), r1=112(y), r2=81(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 112
LDI r2, 81
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
