; DESCRIPTION: Creates a green rectangular region at (71, 124) spanning 87 by 102 pixels.
; PLAN: r0=71(x), r1=124(y), r2=87(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 124
LDI r2, 87
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
