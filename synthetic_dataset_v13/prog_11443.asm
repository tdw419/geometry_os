; DESCRIPTION: Draws a blue rectangle at (202, 4) with width 87 and height 20.
; PLAN: r0=202(x), r1=4(y), r2=87(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 4
LDI r2, 87
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
