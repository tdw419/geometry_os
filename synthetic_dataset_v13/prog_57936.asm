; DESCRIPTION: Draws a red rectangle at (287, 58) with width 82 and height 91.
; PLAN: r0=287(x), r1=58(y), r2=82(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 58
LDI r2, 82
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
