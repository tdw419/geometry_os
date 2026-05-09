; DESCRIPTION: Draws a purple rectangle at (403, 129) with width 103 and height 29.
; PLAN: r0=403(x), r1=129(y), r2=103(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 129
LDI r2, 103
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
