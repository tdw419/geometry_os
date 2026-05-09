; DESCRIPTION: Draws a yellow rectangle at (480, 107) with width 24 and height 20.
; PLAN: r0=480(x), r1=107(y), r2=24(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 107
LDI r2, 24
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
