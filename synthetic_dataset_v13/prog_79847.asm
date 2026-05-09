; DESCRIPTION: Draws a yellow rectangle at (400, 47) with width 17 and height 37.
; PLAN: r0=400(x), r1=47(y), r2=17(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 47
LDI r2, 17
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
