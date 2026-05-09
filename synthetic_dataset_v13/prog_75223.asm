; DESCRIPTION: Draws a orange rectangle at (91, 182) with width 111 and height 64.
; PLAN: r0=91(x), r1=182(y), r2=111(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 182
LDI r2, 111
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
