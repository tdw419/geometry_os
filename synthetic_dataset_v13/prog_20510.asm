; DESCRIPTION: Draws a magenta rectangle at (152, 44) with width 92 and height 120.
; PLAN: r0=152(x), r1=44(y), r2=92(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 44
LDI r2, 92
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
