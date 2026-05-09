; DESCRIPTION: Draws a purple rectangle at (38, 129) with width 11 and height 28.
; PLAN: r0=38(x), r1=129(y), r2=11(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 129
LDI r2, 11
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
