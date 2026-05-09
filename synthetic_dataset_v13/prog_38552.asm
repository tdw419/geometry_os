; DESCRIPTION: Draws a black rectangle at (152, 70) with width 90 and height 111.
; PLAN: r0=152(x), r1=70(y), r2=90(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 70
LDI r2, 90
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
