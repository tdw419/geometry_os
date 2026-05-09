; DESCRIPTION: Draws a red rectangle at (129, 17) with width 111 and height 57.
; PLAN: r0=129(x), r1=17(y), r2=111(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 17
LDI r2, 111
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
