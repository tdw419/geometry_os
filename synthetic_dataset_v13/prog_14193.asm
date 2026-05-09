; DESCRIPTION: Creates a black rectangular region at (330, 9) spanning 89 by 109 pixels.
; PLAN: r0=330(x), r1=9(y), r2=89(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 9
LDI r2, 89
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
