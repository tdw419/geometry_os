; DESCRIPTION: Creates a white rectangular region at (56, 19) spanning 79 by 90 pixels.
; PLAN: r0=56(x), r1=19(y), r2=79(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 19
LDI r2, 79
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
