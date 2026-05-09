; DESCRIPTION: Creates a white rectangular region at (214, 136) spanning 37 by 109 pixels.
; PLAN: r0=214(x), r1=136(y), r2=37(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 136
LDI r2, 37
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
