; DESCRIPTION: Creates a black rectangular region at (265, 74) spanning 112 by 94 pixels.
; PLAN: r0=265(x), r1=74(y), r2=112(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 74
LDI r2, 112
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
