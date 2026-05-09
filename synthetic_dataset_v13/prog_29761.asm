; DESCRIPTION: Creates a black rectangular region at (112, 8) spanning 103 by 115 pixels.
; PLAN: r0=112(x), r1=8(y), r2=103(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 8
LDI r2, 103
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
