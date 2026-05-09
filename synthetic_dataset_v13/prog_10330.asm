; DESCRIPTION: Creates a white rectangular region at (87, 81) spanning 106 by 84 pixels.
; PLAN: r0=87(x), r1=81(y), r2=106(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 81
LDI r2, 106
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
