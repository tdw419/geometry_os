; DESCRIPTION: Draws a black rectangle at (300, 47) with width 60 and height 106.
; PLAN: r0=300(x), r1=47(y), r2=60(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 47
LDI r2, 60
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
