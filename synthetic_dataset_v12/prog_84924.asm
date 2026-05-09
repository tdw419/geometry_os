; DESCRIPTION: Creates a green rectangular region at (388, 154) spanning 77 by 20 pixels.
; PLAN: r0=388(x), r1=154(y), r2=77(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 154
LDI r2, 77
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
