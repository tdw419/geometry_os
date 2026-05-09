; DESCRIPTION: Creates a green rectangular region at (310, 142) spanning 90 by 47 pixels.
; PLAN: r0=310(x), r1=142(y), r2=90(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 142
LDI r2, 90
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
