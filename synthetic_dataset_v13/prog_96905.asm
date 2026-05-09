; DESCRIPTION: Draws a black rectangle at (237, 58) with width 80 and height 106.
; PLAN: r0=237(x), r1=58(y), r2=80(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 58
LDI r2, 80
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
