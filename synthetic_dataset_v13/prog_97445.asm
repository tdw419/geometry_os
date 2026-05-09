; DESCRIPTION: Creates a yellow rectangular region at (46, 163) spanning 91 by 10 pixels.
; PLAN: r0=46(x), r1=163(y), r2=91(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 163
LDI r2, 91
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
