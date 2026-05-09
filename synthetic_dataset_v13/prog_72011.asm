; DESCRIPTION: Draws a cyan rectangle at (58, 172) with width 107 and height 48.
; PLAN: r0=58(x), r1=172(y), r2=107(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 172
LDI r2, 107
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
