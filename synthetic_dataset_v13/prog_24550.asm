; DESCRIPTION: Creates a green rectangular region at (57, 43) spanning 38 by 111 pixels.
; PLAN: r0=57(x), r1=43(y), r2=38(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 43
LDI r2, 38
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
