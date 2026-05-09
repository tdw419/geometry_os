; DESCRIPTION: Draws a blue rectangle at (260, 58) with width 104 and height 46.
; PLAN: r0=260(x), r1=58(y), r2=104(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 58
LDI r2, 104
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
