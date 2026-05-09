; DESCRIPTION: Draws a red rectangle at (478, 146) with width 21 and height 63.
; PLAN: r0=478(x), r1=146(y), r2=21(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 146
LDI r2, 21
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
