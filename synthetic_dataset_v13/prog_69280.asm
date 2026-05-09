; DESCRIPTION: Creates a yellow rectangular region at (64, 85) spanning 81 by 95 pixels.
; PLAN: r0=64(x), r1=85(y), r2=81(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 85
LDI r2, 81
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
