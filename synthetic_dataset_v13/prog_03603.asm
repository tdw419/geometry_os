; DESCRIPTION: Draws a white rectangle at (186, 163) with width 31 and height 22.
; PLAN: r0=186(x), r1=163(y), r2=31(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 163
LDI r2, 31
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
