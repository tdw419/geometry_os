; DESCRIPTION: Draws a yellow rectangle at (237, 82) with width 18 and height 100.
; PLAN: r0=237(x), r1=82(y), r2=18(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 82
LDI r2, 18
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
