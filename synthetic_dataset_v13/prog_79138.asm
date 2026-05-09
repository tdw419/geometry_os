; DESCRIPTION: Draws a blue rectangle at (187, 149) with width 106 and height 103.
; PLAN: r0=187(x), r1=149(y), r2=106(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 149
LDI r2, 106
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
