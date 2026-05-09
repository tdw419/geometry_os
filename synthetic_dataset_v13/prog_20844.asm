; DESCRIPTION: Draws a black rectangle at (126, 79) with width 57 and height 25.
; PLAN: r0=126(x), r1=79(y), r2=57(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 79
LDI r2, 57
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
