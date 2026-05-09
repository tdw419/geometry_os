; DESCRIPTION: Draws a black rectangle at (212, 129) with width 98 and height 79.
; PLAN: r0=212(x), r1=129(y), r2=98(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 129
LDI r2, 98
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
