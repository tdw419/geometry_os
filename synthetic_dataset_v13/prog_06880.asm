; DESCRIPTION: Draws a red rectangle at (329, 127) with width 57 and height 80.
; PLAN: r0=329(x), r1=127(y), r2=57(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 127
LDI r2, 57
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
