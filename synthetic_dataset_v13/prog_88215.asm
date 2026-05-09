; DESCRIPTION: Draws a red rectangle at (332, 44) with width 33 and height 40.
; PLAN: r0=332(x), r1=44(y), r2=33(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 44
LDI r2, 33
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
