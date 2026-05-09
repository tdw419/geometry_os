; DESCRIPTION: Draws a red rectangle at (279, 62) with width 54 and height 72.
; PLAN: r0=279(x), r1=62(y), r2=54(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 62
LDI r2, 54
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
