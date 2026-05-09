; DESCRIPTION: Draws a black rectangle at (70, 223) with width 79 and height 21.
; PLAN: r0=70(x), r1=223(y), r2=79(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 223
LDI r2, 79
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
