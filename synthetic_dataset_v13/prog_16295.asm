; DESCRIPTION: Creates a green rectangular region at (102, 108) spanning 81 by 77 pixels.
; PLAN: r0=102(x), r1=108(y), r2=81(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 108
LDI r2, 81
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
