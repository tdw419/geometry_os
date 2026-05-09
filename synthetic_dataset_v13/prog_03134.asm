; DESCRIPTION: Draws a red rectangle at (277, 127) with width 102 and height 33.
; PLAN: r0=277(x), r1=127(y), r2=102(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 127
LDI r2, 102
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
