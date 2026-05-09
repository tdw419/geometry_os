; DESCRIPTION: Creates a black rectangular region at (36, 134) spanning 120 by 58 pixels.
; PLAN: r0=36(x), r1=134(y), r2=120(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 134
LDI r2, 120
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
