; DESCRIPTION: Creates a yellow rectangular region at (388, 81) spanning 120 by 36 pixels.
; PLAN: r0=388(x), r1=81(y), r2=120(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 81
LDI r2, 120
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
