; DESCRIPTION: Draws a magenta rectangle at (393, 129) with width 61 and height 99.
; PLAN: r0=393(x), r1=129(y), r2=61(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 129
LDI r2, 61
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
