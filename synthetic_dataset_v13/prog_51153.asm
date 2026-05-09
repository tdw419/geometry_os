; DESCRIPTION: Draws a green rectangle at (276, 143) with width 93 and height 46.
; PLAN: r0=276(x), r1=143(y), r2=93(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 143
LDI r2, 93
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
