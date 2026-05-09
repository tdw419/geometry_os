; DESCRIPTION: Creates a white rectangular region at (110, 144) spanning 111 by 17 pixels.
; PLAN: r0=110(x), r1=144(y), r2=111(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 144
LDI r2, 111
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
