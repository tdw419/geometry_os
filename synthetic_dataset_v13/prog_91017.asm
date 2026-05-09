; DESCRIPTION: Draws a red rectangle at (498, 125) with width 10 and height 111.
; PLAN: r0=498(x), r1=125(y), r2=10(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 125
LDI r2, 10
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
