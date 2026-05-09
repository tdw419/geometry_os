; DESCRIPTION: Draws a blue rectangle at (177, 62) with width 47 and height 32.
; PLAN: r0=177(x), r1=62(y), r2=47(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 62
LDI r2, 47
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
