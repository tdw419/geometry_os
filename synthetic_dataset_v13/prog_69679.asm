; DESCRIPTION: Draws a purple rectangle at (27, 221) with width 95 and height 34.
; PLAN: r0=27(x), r1=221(y), r2=95(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 221
LDI r2, 95
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
