; DESCRIPTION: Creates a black rectangular region at (340, 115) spanning 95 by 86 pixels.
; PLAN: r0=340(x), r1=115(y), r2=95(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 115
LDI r2, 95
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
