; DESCRIPTION: Creates a black rectangular region at (189, 120) spanning 112 by 75 pixels.
; PLAN: r0=189(x), r1=120(y), r2=112(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 120
LDI r2, 112
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
