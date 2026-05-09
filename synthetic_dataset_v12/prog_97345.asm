; DESCRIPTION: Creates a green rectangular region at (338, 47) spanning 116 by 25 pixels.
; PLAN: r0=338(x), r1=47(y), r2=116(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 47
LDI r2, 116
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
