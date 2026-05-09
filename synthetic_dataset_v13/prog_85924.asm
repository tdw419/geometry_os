; DESCRIPTION: Draws a blue rectangle at (46, 89) with width 82 and height 47.
; PLAN: r0=46(x), r1=89(y), r2=82(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 89
LDI r2, 82
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
