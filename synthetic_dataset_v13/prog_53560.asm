; DESCRIPTION: Draws a green rectangle at (198, 91) with width 87 and height 82.
; PLAN: r0=198(x), r1=91(y), r2=87(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 91
LDI r2, 87
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
