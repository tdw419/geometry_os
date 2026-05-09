; DESCRIPTION: Creates a blue rectangular region at (297, 2) spanning 24 by 18 pixels.
; PLAN: r0=297(x), r1=2(y), r2=24(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 2
LDI r2, 24
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
