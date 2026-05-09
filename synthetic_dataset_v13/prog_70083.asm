; DESCRIPTION: Draws a blue rectangle at (154, 177) with width 111 and height 22.
; PLAN: r0=154(x), r1=177(y), r2=111(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 177
LDI r2, 111
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
