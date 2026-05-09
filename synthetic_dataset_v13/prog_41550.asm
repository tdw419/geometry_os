; DESCRIPTION: Creates a blue rectangular region at (386, 156) spanning 46 by 83 pixels.
; PLAN: r0=386(x), r1=156(y), r2=46(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 156
LDI r2, 46
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
