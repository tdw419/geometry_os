; DESCRIPTION: Draws a blue rectangle at (298, 95) with width 107 and height 71.
; PLAN: r0=298(x), r1=95(y), r2=107(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 95
LDI r2, 107
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
