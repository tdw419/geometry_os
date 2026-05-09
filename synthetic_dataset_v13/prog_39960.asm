; DESCRIPTION: Draws a green rectangle at (400, 195) with width 71 and height 14.
; PLAN: r0=400(x), r1=195(y), r2=71(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 195
LDI r2, 71
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
