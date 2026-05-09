; DESCRIPTION: Draws a magenta rectangle at (260, 47) with width 57 and height 44.
; PLAN: r0=260(x), r1=47(y), r2=57(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 47
LDI r2, 57
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
