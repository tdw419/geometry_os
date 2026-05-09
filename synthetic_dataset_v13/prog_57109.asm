; DESCRIPTION: Draws a blue rectangle at (393, 71) with width 14 and height 103.
; PLAN: r0=393(x), r1=71(y), r2=14(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 71
LDI r2, 14
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
