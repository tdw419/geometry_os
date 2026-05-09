; DESCRIPTION: Draws a black rectangle at (404, 187) with width 28 and height 52.
; PLAN: r0=404(x), r1=187(y), r2=28(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 187
LDI r2, 28
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
