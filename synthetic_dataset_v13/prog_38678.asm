; DESCRIPTION: Draws a red rectangle at (367, 58) with width 106 and height 117.
; PLAN: r0=367(x), r1=58(y), r2=106(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 58
LDI r2, 106
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
