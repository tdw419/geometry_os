; DESCRIPTION: Creates a white rectangular region at (124, 12) spanning 21 by 17 pixels.
; PLAN: r0=124(x), r1=12(y), r2=21(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 12
LDI r2, 21
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
