; DESCRIPTION: Draws a orange rectangle at (398, 136) with width 91 and height 111.
; PLAN: r0=398(x), r1=136(y), r2=91(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 136
LDI r2, 91
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
