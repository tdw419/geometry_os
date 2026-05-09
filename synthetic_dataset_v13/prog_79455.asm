; DESCRIPTION: Draws a red rectangle at (340, 163) with width 83 and height 48.
; PLAN: r0=340(x), r1=163(y), r2=83(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 163
LDI r2, 83
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
