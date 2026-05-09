; DESCRIPTION: Creates a green rectangular region at (280, 83) spanning 102 by 58 pixels.
; PLAN: r0=280(x), r1=83(y), r2=102(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 83
LDI r2, 102
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
