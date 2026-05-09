; DESCRIPTION: Creates a blue rectangular region at (77, 218) spanning 115 by 27 pixels.
; PLAN: r0=77(x), r1=218(y), r2=115(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 218
LDI r2, 115
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
