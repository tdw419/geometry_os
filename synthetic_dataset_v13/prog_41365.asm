; DESCRIPTION: Draws a red rectangle at (428, 163) with width 13 and height 56.
; PLAN: r0=428(x), r1=163(y), r2=13(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 163
LDI r2, 13
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
