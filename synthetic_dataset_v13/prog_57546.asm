; DESCRIPTION: Draws a green rectangle at (112, 215) with width 38 and height 21.
; PLAN: r0=112(x), r1=215(y), r2=38(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 215
LDI r2, 38
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
