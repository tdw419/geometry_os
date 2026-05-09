; DESCRIPTION: Creates a white rectangular region at (152, 135) spanning 51 by 68 pixels.
; PLAN: r0=152(x), r1=135(y), r2=51(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 135
LDI r2, 51
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
