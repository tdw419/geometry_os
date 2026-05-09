; DESCRIPTION: Creates a black rectangular region at (71, 124) spanning 52 by 33 pixels.
; PLAN: r0=71(x), r1=124(y), r2=52(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 124
LDI r2, 52
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
