; DESCRIPTION: Creates a white rectangular region at (96, 147) spanning 96 by 109 pixels.
; PLAN: r0=96(x), r1=147(y), r2=96(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 147
LDI r2, 96
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
