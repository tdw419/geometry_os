; DESCRIPTION: Creates a white rectangular region at (399, 141) spanning 110 by 50 pixels.
; PLAN: r0=399(x), r1=141(y), r2=110(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 141
LDI r2, 110
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
