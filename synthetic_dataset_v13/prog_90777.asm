; DESCRIPTION: Draws a green rectangle at (214, 154) with width 51 and height 76.
; PLAN: r0=214(x), r1=154(y), r2=51(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 154
LDI r2, 51
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
