; DESCRIPTION: Draws a red rectangle at (374, 27) with width 94 and height 96.
; PLAN: r0=374(x), r1=27(y), r2=94(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 27
LDI r2, 94
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
