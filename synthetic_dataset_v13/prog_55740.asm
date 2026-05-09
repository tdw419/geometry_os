; DESCRIPTION: Creates a yellow rectangular region at (186, 24) spanning 96 by 83 pixels.
; PLAN: r0=186(x), r1=24(y), r2=96(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 24
LDI r2, 96
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
