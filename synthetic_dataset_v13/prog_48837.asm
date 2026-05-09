; DESCRIPTION: Creates a white rectangular region at (99, 25) spanning 91 by 94 pixels.
; PLAN: r0=99(x), r1=25(y), r2=91(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 25
LDI r2, 91
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
