; DESCRIPTION: Draws a green rectangle at (403, 35) with width 48 and height 111.
; PLAN: r0=403(x), r1=35(y), r2=48(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 35
LDI r2, 48
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
