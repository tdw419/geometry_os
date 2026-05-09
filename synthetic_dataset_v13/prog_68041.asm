; DESCRIPTION: Creates a white rectangular region at (139, 136) spanning 91 by 45 pixels.
; PLAN: r0=139(x), r1=136(y), r2=91(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 136
LDI r2, 91
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
