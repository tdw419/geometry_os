; DESCRIPTION: Creates a yellow rectangular region at (203, 160) spanning 47 by 86 pixels.
; PLAN: r0=203(x), r1=160(y), r2=47(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 160
LDI r2, 47
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
