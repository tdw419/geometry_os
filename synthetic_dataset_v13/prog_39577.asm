; DESCRIPTION: Draws a black rectangle at (237, 74) with width 95 and height 72.
; PLAN: r0=237(x), r1=74(y), r2=95(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 74
LDI r2, 95
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
