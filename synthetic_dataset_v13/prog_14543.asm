; DESCRIPTION: Creates a green rectangular region at (21, 38) spanning 19 by 18 pixels.
; PLAN: r0=21(x), r1=38(y), r2=19(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 38
LDI r2, 19
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
