; DESCRIPTION: Draws a red rectangle at (253, 163) with width 68 and height 92.
; PLAN: r0=253(x), r1=163(y), r2=68(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 163
LDI r2, 68
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
