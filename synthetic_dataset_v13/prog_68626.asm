; DESCRIPTION: Creates a white rectangular region at (282, 109) spanning 58 by 109 pixels.
; PLAN: r0=282(x), r1=109(y), r2=58(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 109
LDI r2, 58
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
