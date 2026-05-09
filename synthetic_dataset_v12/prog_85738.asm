; DESCRIPTION: Draws a green rectangle at (391, 149) with width 111 and height 91.
; PLAN: r0=391(x), r1=149(y), r2=111(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 149
LDI r2, 111
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
