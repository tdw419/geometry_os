; DESCRIPTION: Draws a yellow rectangle at (284, 23) with width 63 and height 115.
; PLAN: r0=284(x), r1=23(y), r2=63(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 23
LDI r2, 63
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
