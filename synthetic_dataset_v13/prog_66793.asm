; DESCRIPTION: Draws a blue rectangle at (202, 37) with width 21 and height 68.
; PLAN: r0=202(x), r1=37(y), r2=21(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 37
LDI r2, 21
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
