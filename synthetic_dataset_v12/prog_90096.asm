; DESCRIPTION: Creates a white rectangular region at (185, 178) spanning 100 by 49 pixels.
; PLAN: r0=185(x), r1=178(y), r2=100(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 178
LDI r2, 100
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
