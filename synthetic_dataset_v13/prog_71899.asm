; DESCRIPTION: Creates a black rectangular region at (377, 140) spanning 75 by 91 pixels.
; PLAN: r0=377(x), r1=140(y), r2=75(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 140
LDI r2, 75
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
