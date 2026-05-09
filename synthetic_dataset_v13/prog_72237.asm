; DESCRIPTION: Draws a blue rectangle at (36, 146) with width 65 and height 30.
; PLAN: r0=36(x), r1=146(y), r2=65(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 146
LDI r2, 65
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
