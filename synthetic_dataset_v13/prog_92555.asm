; DESCRIPTION: Draws a white rectangle at (374, 107) with width 23 and height 110.
; PLAN: r0=374(x), r1=107(y), r2=23(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 107
LDI r2, 23
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
