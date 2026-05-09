; DESCRIPTION: Creates a green rectangular region at (297, 139) spanning 113 by 110 pixels.
; PLAN: r0=297(x), r1=139(y), r2=113(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 139
LDI r2, 113
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
