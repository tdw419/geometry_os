; DESCRIPTION: Draws a yellow rectangle at (170, 215) with width 94 and height 28.
; PLAN: r0=170(x), r1=215(y), r2=94(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 215
LDI r2, 94
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
