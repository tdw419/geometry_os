; DESCRIPTION: Draws a purple rectangle at (153, 129) with width 72 and height 10.
; PLAN: r0=153(x), r1=129(y), r2=72(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 129
LDI r2, 72
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
