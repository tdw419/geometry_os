; DESCRIPTION: Creates a black rectangular region at (54, 223) spanning 91 by 15 pixels.
; PLAN: r0=54(x), r1=223(y), r2=91(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 223
LDI r2, 91
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
