; DESCRIPTION: Draws a cyan rectangle at (172, 98) with width 103 and height 57.
; PLAN: r0=172(x), r1=98(y), r2=103(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 98
LDI r2, 103
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
