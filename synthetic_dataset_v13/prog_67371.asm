; DESCRIPTION: Draws a red rectangle at (244, 163) with width 29 and height 12.
; PLAN: r0=244(x), r1=163(y), r2=29(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 163
LDI r2, 29
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
