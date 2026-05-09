; DESCRIPTION: Creates a yellow rectangular region at (125, 33) spanning 50 by 91 pixels.
; PLAN: r0=125(x), r1=33(y), r2=50(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 33
LDI r2, 50
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
