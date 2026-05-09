; DESCRIPTION: Creates a green rectangular region at (380, 72) spanning 19 by 105 pixels.
; PLAN: r0=380(x), r1=72(y), r2=19(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 72
LDI r2, 19
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
