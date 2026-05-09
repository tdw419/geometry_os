; DESCRIPTION: Draws a magenta rectangle at (146, 158) with width 48 and height 45.
; PLAN: r0=146(x), r1=158(y), r2=48(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 158
LDI r2, 48
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
