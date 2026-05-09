; DESCRIPTION: Creates a black rectangular region at (213, 17) spanning 36 by 29 pixels.
; PLAN: r0=213(x), r1=17(y), r2=36(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 17
LDI r2, 36
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
