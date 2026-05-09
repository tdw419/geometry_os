; DESCRIPTION: Draws a red rectangle at (107, 33) with width 67 and height 23.
; PLAN: r0=107(x), r1=33(y), r2=67(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 33
LDI r2, 67
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
