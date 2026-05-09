; DESCRIPTION: Draws a red rectangle at (445, 54) with width 63 and height 44.
; PLAN: r0=445(x), r1=54(y), r2=63(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 54
LDI r2, 63
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
