; DESCRIPTION: Draws a red rectangle at (154, 147) with width 91 and height 76.
; PLAN: r0=154(x), r1=147(y), r2=91(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 147
LDI r2, 91
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
