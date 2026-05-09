; DESCRIPTION: Draws a red rectangle at (287, 231) with width 47 and height 23.
; PLAN: r0=287(x), r1=231(y), r2=47(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 231
LDI r2, 47
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
