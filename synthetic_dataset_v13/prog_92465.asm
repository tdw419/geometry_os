; DESCRIPTION: Creates a white rectangular region at (89, 44) spanning 91 by 117 pixels.
; PLAN: r0=89(x), r1=44(y), r2=91(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 44
LDI r2, 91
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
