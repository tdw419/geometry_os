; DESCRIPTION: Creates a black rectangular region at (340, 176) spanning 65 by 66 pixels.
; PLAN: r0=340(x), r1=176(y), r2=65(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 176
LDI r2, 65
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
