; DESCRIPTION: Creates a white rectangular region at (453, 4) spanning 27 by 106 pixels.
; PLAN: r0=453(x), r1=4(y), r2=27(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 4
LDI r2, 27
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
