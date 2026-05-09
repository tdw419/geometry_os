; DESCRIPTION: Creates a yellow rectangular region at (356, 71) spanning 95 by 81 pixels.
; PLAN: r0=356(x), r1=71(y), r2=95(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 71
LDI r2, 95
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
