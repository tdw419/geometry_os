; DESCRIPTION: Draws a red rectangle at (196, 160) with width 68 and height 71.
; PLAN: r0=196(x), r1=160(y), r2=68(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 160
LDI r2, 68
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
