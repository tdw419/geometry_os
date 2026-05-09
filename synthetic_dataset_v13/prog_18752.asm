; DESCRIPTION: Draws a purple rectangle at (144, 129) with width 32 and height 108.
; PLAN: r0=144(x), r1=129(y), r2=32(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 129
LDI r2, 32
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
