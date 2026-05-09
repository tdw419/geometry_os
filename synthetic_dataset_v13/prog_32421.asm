; DESCRIPTION: Draws a blue rectangle at (242, 125) with width 108 and height 48.
; PLAN: r0=242(x), r1=125(y), r2=108(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 125
LDI r2, 108
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
