; DESCRIPTION: Creates a white rectangular region at (402, 17) spanning 109 by 40 pixels.
; PLAN: r0=402(x), r1=17(y), r2=109(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 17
LDI r2, 109
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
