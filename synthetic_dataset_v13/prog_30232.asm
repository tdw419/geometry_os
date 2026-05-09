; DESCRIPTION: Draws a purple rectangle at (368, 16) with width 54 and height 95.
; PLAN: r0=368(x), r1=16(y), r2=54(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 16
LDI r2, 54
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
