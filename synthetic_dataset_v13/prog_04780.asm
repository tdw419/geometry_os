; DESCRIPTION: Creates a black rectangular region at (27, 88) spanning 91 by 21 pixels.
; PLAN: r0=27(x), r1=88(y), r2=91(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 88
LDI r2, 91
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
