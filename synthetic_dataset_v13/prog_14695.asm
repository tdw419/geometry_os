; DESCRIPTION: Draws a cyan rectangle at (314, 127) with width 111 and height 17.
; PLAN: r0=314(x), r1=127(y), r2=111(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 127
LDI r2, 111
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
