; DESCRIPTION: Draws a cyan rectangle at (185, 187) with width 112 and height 24.
; PLAN: r0=185(x), r1=187(y), r2=112(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 187
LDI r2, 112
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
