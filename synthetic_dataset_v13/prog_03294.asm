; DESCRIPTION: Draws a yellow rectangle at (414, 82) with width 28 and height 12.
; PLAN: r0=414(x), r1=82(y), r2=28(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 82
LDI r2, 28
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
