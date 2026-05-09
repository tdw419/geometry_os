; DESCRIPTION: Draws a red rectangle at (297, 189) with width 24 and height 65.
; PLAN: r0=297(x), r1=189(y), r2=24(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 189
LDI r2, 24
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
