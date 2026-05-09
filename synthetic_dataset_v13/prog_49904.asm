; DESCRIPTION: Draws a yellow rectangle at (464, 91) with width 27 and height 31.
; PLAN: r0=464(x), r1=91(y), r2=27(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 91
LDI r2, 27
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
