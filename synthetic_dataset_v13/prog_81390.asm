; DESCRIPTION: Creates a black rectangular region at (213, 48) spanning 17 by 85 pixels.
; PLAN: r0=213(x), r1=48(y), r2=17(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 48
LDI r2, 17
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
