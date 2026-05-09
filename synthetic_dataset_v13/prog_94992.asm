; DESCRIPTION: Creates a yellow rectangular region at (95, 87) spanning 112 by 115 pixels.
; PLAN: r0=95(x), r1=87(y), r2=112(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 87
LDI r2, 112
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
