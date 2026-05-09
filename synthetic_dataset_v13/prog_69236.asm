; DESCRIPTION: Creates a white rectangular region at (162, 37) spanning 11 by 33 pixels.
; PLAN: r0=162(x), r1=37(y), r2=11(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 37
LDI r2, 11
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
