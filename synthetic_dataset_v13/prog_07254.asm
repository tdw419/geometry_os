; DESCRIPTION: Creates a green rectangular region at (3, 77) spanning 53 by 103 pixels.
; PLAN: r0=3(x), r1=77(y), r2=53(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 77
LDI r2, 53
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
