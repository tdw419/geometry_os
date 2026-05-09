; DESCRIPTION: Draws a blue rectangle at (146, 140) with width 113 and height 77.
; PLAN: r0=146(x), r1=140(y), r2=113(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 140
LDI r2, 113
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
