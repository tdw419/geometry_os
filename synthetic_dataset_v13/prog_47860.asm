; DESCRIPTION: Draws a cyan rectangle at (98, 107) with width 84 and height 60.
; PLAN: r0=98(x), r1=107(y), r2=84(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 107
LDI r2, 84
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
