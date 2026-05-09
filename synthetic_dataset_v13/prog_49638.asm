; DESCRIPTION: Draws a green rectangle at (307, 215) with width 81 and height 29.
; PLAN: r0=307(x), r1=215(y), r2=81(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 215
LDI r2, 81
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
