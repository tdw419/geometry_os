; DESCRIPTION: Creates a red rectangular region at (17, 232) spanning 91 by 13 pixels.
; PLAN: r0=17(x), r1=232(y), r2=91(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 232
LDI r2, 91
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
