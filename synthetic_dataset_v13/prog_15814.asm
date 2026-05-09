; DESCRIPTION: Draws a purple rectangle at (185, 129) with width 36 and height 33.
; PLAN: r0=185(x), r1=129(y), r2=36(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 129
LDI r2, 36
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
