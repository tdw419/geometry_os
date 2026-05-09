; DESCRIPTION: Draws a purple rectangle at (393, 143) with width 113 and height 54.
; PLAN: r0=393(x), r1=143(y), r2=113(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 143
LDI r2, 113
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
