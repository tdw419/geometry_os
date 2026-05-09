; DESCRIPTION: Creates a green rectangular region at (288, 80) spanning 102 by 116 pixels.
; PLAN: r0=288(x), r1=80(y), r2=102(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 80
LDI r2, 102
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
