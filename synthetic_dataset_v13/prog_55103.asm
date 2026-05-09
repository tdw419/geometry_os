; DESCRIPTION: Draws a orange rectangle at (86, 182) with width 94 and height 63.
; PLAN: r0=86(x), r1=182(y), r2=94(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 182
LDI r2, 94
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
