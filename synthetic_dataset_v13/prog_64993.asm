; DESCRIPTION: Creates a green rectangular region at (386, 37) spanning 74 by 105 pixels.
; PLAN: r0=386(x), r1=37(y), r2=74(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 37
LDI r2, 74
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
