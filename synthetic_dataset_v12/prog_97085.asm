; DESCRIPTION: Draws a blue rectangle at (70, 152) with width 39 and height 93.
; PLAN: r0=70(x), r1=152(y), r2=39(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 152
LDI r2, 39
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
