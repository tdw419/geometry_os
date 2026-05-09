; DESCRIPTION: Creates a white rectangular region at (353, 132) spanning 112 by 55 pixels.
; PLAN: r0=353(x), r1=132(y), r2=112(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 132
LDI r2, 112
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
