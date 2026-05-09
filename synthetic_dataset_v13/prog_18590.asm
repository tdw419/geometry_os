; DESCRIPTION: Draws a yellow rectangle at (297, 174) with width 45 and height 80.
; PLAN: r0=297(x), r1=174(y), r2=45(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 174
LDI r2, 45
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
