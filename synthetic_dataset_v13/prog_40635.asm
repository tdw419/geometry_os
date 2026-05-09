; DESCRIPTION: Draws a black rectangle at (404, 167) with width 18 and height 18.
; PLAN: r0=404(x), r1=167(y), r2=18(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 167
LDI r2, 18
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
