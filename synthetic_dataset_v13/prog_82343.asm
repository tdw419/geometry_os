; DESCRIPTION: Draws a black rectangle at (387, 94) with width 104 and height 106.
; PLAN: r0=387(x), r1=94(y), r2=104(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 94
LDI r2, 104
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
