; DESCRIPTION: Draws a white rectangle at (220, 19) with width 111 and height 93.
; PLAN: r0=220(x), r1=19(y), r2=111(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 19
LDI r2, 111
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
