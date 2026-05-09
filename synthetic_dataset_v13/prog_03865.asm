; DESCRIPTION: Draws a yellow rectangle at (346, 58) with width 91 and height 78.
; PLAN: r0=346(x), r1=58(y), r2=91(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 58
LDI r2, 91
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
