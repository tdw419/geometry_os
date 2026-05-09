; DESCRIPTION: Draws a red rectangle at (46, 60) with width 86 and height 84.
; PLAN: r0=46(x), r1=60(y), r2=86(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 60
LDI r2, 86
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
