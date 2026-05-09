; DESCRIPTION: Creates a yellow rectangular region at (217, 12) spanning 29 by 70 pixels.
; PLAN: r0=217(x), r1=12(y), r2=29(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 12
LDI r2, 29
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
