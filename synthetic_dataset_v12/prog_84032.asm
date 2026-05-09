; DESCRIPTION: Creates a yellow rectangular region at (112, 120) spanning 101 by 30 pixels.
; PLAN: r0=112(x), r1=120(y), r2=101(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 120
LDI r2, 101
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
