; DESCRIPTION: Creates a white rectangular region at (269, 192) spanning 114 by 52 pixels.
; PLAN: r0=269(x), r1=192(y), r2=114(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 192
LDI r2, 114
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
