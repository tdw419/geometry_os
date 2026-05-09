; DESCRIPTION: Creates a white rectangular region at (222, 152) spanning 84 by 15 pixels.
; PLAN: r0=222(x), r1=152(y), r2=84(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 152
LDI r2, 84
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
