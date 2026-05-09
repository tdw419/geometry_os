; DESCRIPTION: Draws a red rectangle at (372, 218) with width 114 and height 13.
; PLAN: r0=372(x), r1=218(y), r2=114(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 218
LDI r2, 114
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
