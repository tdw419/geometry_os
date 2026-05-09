; DESCRIPTION: Creates a green rectangular region at (89, 190) spanning 111 by 38 pixels.
; PLAN: r0=89(x), r1=190(y), r2=111(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 190
LDI r2, 111
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
