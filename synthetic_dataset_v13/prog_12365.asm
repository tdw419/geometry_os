; DESCRIPTION: Draws a red rectangle at (60, 22) with width 86 and height 111.
; PLAN: r0=60(x), r1=22(y), r2=86(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 22
LDI r2, 86
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
