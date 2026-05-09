; DESCRIPTION: Creates a green rectangular region at (283, 124) spanning 35 by 95 pixels.
; PLAN: r0=283(x), r1=124(y), r2=35(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 124
LDI r2, 35
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
