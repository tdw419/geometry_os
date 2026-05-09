; DESCRIPTION: Creates a red rectangular region at (71, 77) spanning 58 by 80 pixels.
; PLAN: r0=71(x), r1=77(y), r2=58(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 77
LDI r2, 58
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
