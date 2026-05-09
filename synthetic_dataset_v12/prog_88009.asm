; DESCRIPTION: Draws a red rectangle at (228, 104) with width 13 and height 99.
; PLAN: r0=228(x), r1=104(y), r2=13(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 104
LDI r2, 13
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
