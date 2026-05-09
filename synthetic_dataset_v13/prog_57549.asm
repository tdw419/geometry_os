; DESCRIPTION: Creates a yellow rectangular region at (330, 203) spanning 20 by 36 pixels.
; PLAN: r0=330(x), r1=203(y), r2=20(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 203
LDI r2, 20
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
