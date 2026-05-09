; DESCRIPTION: Draws a red rectangle at (220, 127) with width 80 and height 64.
; PLAN: r0=220(x), r1=127(y), r2=80(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 127
LDI r2, 80
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
