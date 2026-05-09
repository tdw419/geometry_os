; DESCRIPTION: Creates a yellow rectangular region at (25, 9) spanning 117 by 91 pixels.
; PLAN: r0=25(x), r1=9(y), r2=117(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 9
LDI r2, 117
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
