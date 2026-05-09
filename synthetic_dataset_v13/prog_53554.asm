; DESCRIPTION: Draws a yellow rectangle at (168, 188) with width 75 and height 64.
; PLAN: r0=168(x), r1=188(y), r2=75(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 188
LDI r2, 75
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
