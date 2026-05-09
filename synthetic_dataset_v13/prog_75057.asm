; DESCRIPTION: Creates a black rectangular region at (73, 183) spanning 52 by 65 pixels.
; PLAN: r0=73(x), r1=183(y), r2=52(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 183
LDI r2, 52
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
