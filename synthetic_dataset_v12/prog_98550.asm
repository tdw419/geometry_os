; DESCRIPTION: Draws a yellow rectangle at (248, 58) with width 65 and height 56.
; PLAN: r0=248(x), r1=58(y), r2=65(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 58
LDI r2, 65
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
