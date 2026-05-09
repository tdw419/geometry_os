; DESCRIPTION: Draws a blue rectangle at (395, 107) with width 60 and height 68.
; PLAN: r0=395(x), r1=107(y), r2=60(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 107
LDI r2, 60
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
