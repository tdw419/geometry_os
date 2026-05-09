; DESCRIPTION: Creates a black rectangular region at (48, 139) spanning 54 by 112 pixels.
; PLAN: r0=48(x), r1=139(y), r2=54(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 139
LDI r2, 54
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
