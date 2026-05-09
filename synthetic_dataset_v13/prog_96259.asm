; DESCRIPTION: Draws a purple rectangle at (392, 187) with width 30 and height 39.
; PLAN: r0=392(x), r1=187(y), r2=30(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 187
LDI r2, 30
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
