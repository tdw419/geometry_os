; DESCRIPTION: Creates a black rectangular region at (36, 174) spanning 94 by 81 pixels.
; PLAN: r0=36(x), r1=174(y), r2=94(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 174
LDI r2, 94
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
