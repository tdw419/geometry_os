; DESCRIPTION: Draws a blue rectangle at (350, 107) with width 46 and height 44.
; PLAN: r0=350(x), r1=107(y), r2=46(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 107
LDI r2, 46
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
