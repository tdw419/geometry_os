; DESCRIPTION: Draws a red rectangle at (267, 104) with width 48 and height 65.
; PLAN: r0=267(x), r1=104(y), r2=48(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 104
LDI r2, 48
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
