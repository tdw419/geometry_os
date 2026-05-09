; DESCRIPTION: Creates a white rectangular region at (217, 230) spanning 24 by 22 pixels.
; PLAN: r0=217(x), r1=230(y), r2=24(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 230
LDI r2, 24
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
