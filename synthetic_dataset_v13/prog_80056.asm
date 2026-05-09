; DESCRIPTION: Draws a purple rectangle at (295, 59) with width 50 and height 107.
; PLAN: r0=295(x), r1=59(y), r2=50(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 59
LDI r2, 50
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
